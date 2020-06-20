import { useState } from 'react';
import io from 'socket.io-client';

const socket = io();

export function usePlayState() {
    let [isPlaying, setIsPlaying] = useState(false);

    socket.on('play-state-change', res => {
        console.log('play-state-change', res)
        setIsPlaying(res == 'playing')
    })

    return [
        isPlaying,
        (isPlaying) => socket.emit('setIsPlaying', isPlaying)
    ]
}

export function useCurrentTrack() {
    let [currentTrack, setCurrentTrack] = useState({});

    socket.on('current-track-change', res => {
        console.log('current-track-change', res)
        setCurrentTrack(res)
    })

    return currentTrack
}

let receiveEvents = true
let receiveEventsTimeout
export function useCurrentVolume() {
    let [currentVolume, setCurrentVolume] = useState(0);

    socket.on('volume-change', res => {
        if (receiveEvents) {
            console.log('current-volume-change2', res)
            setCurrentVolume(res)
        }
    })

    return [
        currentVolume,
        (newVolume) => {
            setCurrentVolume(newVolume)

            if (receiveEventsTimeout != null) {
                clearTimeout(receiveEventsTimeout)
                receiveEventsTimeout = null
            }

            receiveEventsTimeout = setTimeout(() => {
                receiveEvents = true
                receiveEventsTimeout = null
            }, 1000)

            receiveEvents = false
            socket.emit('set-volume', newVolume);
        }
    ]
}

export function useCurrentTopology(mainDeviceRoomName) {
    let [devices, setDevices] = useState({})


    socket.on('topology-change', res => {
        console.log('topo-change', res);
        let topData = res.eventBody.ZoneGroupState.ZoneGroupState.ZoneGroups.ZoneGroup

        if (topData.length === undefined) {
            topData = [topData]
        }

        let newDevices = {};
        topData.forEach(group => {
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

        setDevices(newDevices)
    })

    let addDevice = (deviceName) => {
        socket.emit('add-device', deviceName)
    }

    let removeDevice = (deviceName) => {
        socket.emit('remove-device', deviceName)
    }

    return [devices, addDevice, removeDevice]
}

export function useSonosActions() {
    return {
        next: () => socket.emit('next'),
        previous: () => socket.emit('previous')
    }
}

// let mainDeviceGroup = [];
// let otherDevices = [];
// data.forEach(group => {
//     let isMain = false;

//     group.ZoneGroupMember.forEach(zoneMember => {
//         if (zoneMember.ZoneName == props.mainDeviceRoomName) {
//             isMain = true;
//         }
//     })

//     if (!isMain) {
//         otherDevices = otherDevices.concat(group.ZoneGroupMember)
//     } else {
//         mainDeviceGroup = group.ZoneGroupMember;
//     }
// })

// let nonMainDevices = mainDeviceGroup
//     .concat(otherDevices)
//     .filter(zoneMember => zoneMember.ZoneName != props.mainDeviceRoomName)

// nonMainDevices.sort((a, b) => {
//     return a.ZoneName.localeCompare(b.ZoneName)
// });