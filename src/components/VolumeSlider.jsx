import React, {useState, useEffect} from 'react';

function VolumeSlider(props) {
    let [volume, setVolume] = useState(0)

    useEffect(() => {
        props.socket.once('volume-change', setVolume)
    }, [])

    let _handleChange = (e) => {
        let newVolume = e.target.value;
        setVolume(newVolume)
        props.socket.emit('set-volume', newVolume)
    }

    return <input type="range" min="1" max="100" value={volume} onChange={_handleChange} />
}

export default VolumeSlider;