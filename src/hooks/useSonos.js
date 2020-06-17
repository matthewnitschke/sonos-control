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

export function useCurrentTopology() {
    let [topo, setTopo] = useState([])

    socket.on('topology-change', res => {
        // if eventBody is empty, the topo change had nothing to do with
        // the main device
        if (Object.entries(res.eventBody).length > 0) {
            console.log('topo-change', res);
            let topData = res.eventBody.ZoneGroupState.ZoneGroupState.ZoneGroups.ZoneGroup

            if (topData.length === undefined) {
                topData = [topData]
            }

            setTopo(topData)
        }
    })

    return topo
}

export function useSonosActions() {
    return {
        next: () => socket.emit('next'),
        previous: () => socket.emit('previous')
    }
}