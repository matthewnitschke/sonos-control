const { mainDeviceName } = require('../environment.js');

const { DeviceDiscovery, Listener } = require('sonos');

DeviceDiscovery((device) => {
    device.deviceDescription().then(desc => {
      console.log(`Device Found: ${desc.roomName} ${desc.roomName == mainDeviceName ? '(Using as main device)' : ''}`);
      if (desc.roomName == mainDeviceName) {
        console.log(`Found Main Device: ${desc.roomName}:${device.host}`)
        let mainDevice = device
  
        mainDevice.on('PlayState', result => {
            console.log('Play State Change:', result)
        })
  
        mainDevice.on('CurrentTrack', result => {
            console.log('Current Track Change')
        })
  
        mainDevice.on('Volume', result => {
          console.log('VolumeChange:', result)
        })
      }
    });
  });