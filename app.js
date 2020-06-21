const port = 3000;
const express = require('express');
const app = express();
const http = require('http').createServer(app);
const io = require('socket.io')(http);

const spotifyApi = require('./src/spotify-api.js')

const { spotifyUserId } = require('./src/environment.js')

const { DeviceDiscovery, Listener } = require("sonos");

const mainDeviceRoomName = 'Office'
let mainDevice;
let otherDevices = {};

let currentState;
let currentTrack;
let currentVolume;
DeviceDiscovery((device) => {
  device.deviceDescription().then(desc => {
    if (desc.roomName == mainDeviceRoomName) {
      console.log(`Found Main Device: ${desc.roomName}:${device.host}`)
      mainDevice = device
      Listener.subscribeTo(mainDevice)

      mainDevice.on('PlayState', result => {
        currentState = result
        io.sockets.emit('play-state-change', result)
      })

      mainDevice.on('CurrentTrack', result => {
        currentTrack = result
        io.sockets.emit('current-track-change', result)
      })

      mainDevice.on('Volume', result => {
        currentVolume = result
        io.sockets.emit('volume-change', result)
      })
    } else {
      otherDevices[desc.roomName] = device
    }
  });
});

let currentTopology;
Listener.on('ZoneGroupTopology', result => {
  if (Object.entries(result.eventBody).length > 0) {
    currentTopology = result;
    io.sockets.emit('topology-change', result);
    console.log('topo')
  }
})

app.use(express.static("dist"));

app.get("/", (req, res) => res.send("Hello World!"));

app.get('/spotify-library', async (req, res) => {
  let playlists = await spotifyApi.getUserPlaylists()

  res.send(playlists)
})

io.on('connection', (socket) => {
  console.log('a user connected');

  // give the frontend a bit to catch up before emitting updates
  setTimeout(() => {
    console.log('Emitting Updates')
    socket.emit('topology-change', currentTopology)
    socket.emit('play-state-change', currentState)
    socket.emit('current-track-change', currentTrack)
    socket.emit('volume-change', currentVolume)
  }, 1000)

  socket.on('setIsPlaying', (isPlaying) => {
    if (isPlaying) {
      mainDevice.play()
    } else {
      mainDevice.pause()
    }
  })

  socket.on('next', () => mainDevice.next())
  socket.on('previous', () => mainDevice.previous())
  socket.on('set-volume', (v) => mainDevice.setVolume(v))
  socket.on('add-device', (deviceName) => otherDevices[deviceName].joinGroup(mainDeviceRoomName))
  socket.on('remove-device', (deviceName) => otherDevices[deviceName].leaveGroup())
  socket.on('play-user-playlist', (uri) => {
    let parts = uri.split(':')
    let id = parts[parts.length-1]
    let correctedURI = `spotify:user:${spotifyUserId}:playlist:${id}`
    
    mainDevice.flush()
    mainDevice.queue(correctedURI);
  })
});

http.listen(port, () =>
  console.log(`Example app listening at http://localhost:${port}`)
);


// Subscribe to the CTRL + C event and cancel the current subscribtions
process.on('SIGINT', () => {
  console.log('Hold-on cancelling all subscriptions')
  Listener.stopListener().then(result => {
    console.log('Cancelled all subscriptions')
    process.exit()
  }).catch(err => {
    console.log('Error cancelling subscriptions, exit in 3 seconds  %s', err)
    setTimeout(() => {
      process.exit(1)
    }, 2500)
  })
})