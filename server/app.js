const path = require('path')

const port = 3000;
const express = require('express');
const app = express();
const http = require('http').createServer(app);
const io = require('socket.io')(http);

const spotifyApi = require('./spotify_api.js')

const { spotifyUserId } = require('./environment.js')

const { DeviceDiscovery, Listener } = require('sonos');

const mainDeviceRoomName = 'Office'
let mainDevice;
let otherDevices = {};

let currentState;
let currentTrack;
let currentVolume;
DeviceDiscovery((device) => {
  device.deviceDescription().then(desc => {
    console.log(`Device Found: ${desc.roomName}`);
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
        console.log(currentTrack);
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
  if (Object.entries(result.eventBody).length == 0) {
    return;
  }

  let data = result.eventBody.ZoneGroupState.ZoneGroupState.ZoneGroups.ZoneGroup;

  if (data.length === undefined) {
    data = [data]
  }

  let newDevices = {};
  data.forEach(group => {
      let isMain = false;
      group.ZoneGroupMember.forEach(zoneMember => {
          if (zoneMember.ZoneName == mainDeviceRoomName) {
              isMain = true;
          }
      })

      group.ZoneGroupMember.forEach((zone) => {
          // we dont want to add the main device to the list of checkbox devices
          if (zone.ZoneName != mainDeviceRoomName) {
              newDevices[zone.ZoneName] = isMain
          }
      });
  });

  console.log(newDevices);

  currentTopology = newDevices;
  io.sockets.emit('topology-change', newDevices);  
})

app.use(express.static(path.join(__dirname, '..', 'client/build/web/')))
app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, '..', 'client/build/web/index.html'));
})

// app.use(express.static('web'))
// app.get('/', (req, res) => {
//   res.sendFile(path.join(__dirname + '/web/index.html'));
// })


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
  socket.on('add-device-to-zone', (deviceName) => otherDevices[deviceName].joinGroup(mainDeviceRoomName))
  socket.on('remove-device-from-zone', (deviceName) => otherDevices[deviceName].leaveGroup())
  socket.on('play-uri', (uri) => {
    mainDevice.flush()
    mainDevice.queue(uri);
    mainDevice.play();
  })

  socket.on('sonos-library', async (resp) => {
    let playlists = await spotifyApi.getUserPlaylists()

    playlists = playlists.body.items.map((playlist) => {
      let parts = playlist.uri.split(':')
      let id = parts[parts.length-1]
      let correctedURI = `spotify:user:${spotifyUserId}:playlist:${id}`

      return {
        name: playlist.name,
        uri: correctedURI
      }
    })

    resp(playlists);
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