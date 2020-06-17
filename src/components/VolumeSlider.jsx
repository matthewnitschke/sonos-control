import React, {useState, useEffect} from 'react';
import {useCurrentVolume} from '../hooks/useSonos.js'

function VolumeSlider(props) {
    let [currentVolume, setCurrentVolume] = useCurrentVolume()

    let _handleChange = (e) => {
        let newVolume = e.target.value;
        setCurrentVolume(newVolume)
        // setVolume(newVolume)
        // props.socket.emit('set-volume', newVolume)
    }

    return <div className="volume-slider">
        <input
            type="range" 
            min="1" 
            max="100" 
            value={currentVolume} 
            onChange={_handleChange} /> 
    </div>
}

export default VolumeSlider;