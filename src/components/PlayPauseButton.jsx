import React, {useState, useEffect} from 'react';

function PlayPauseButton(props) {
    let [isPlaying, setIsPlaying] = useState(false)

    useEffect(() => {
        props.socket.on('play-state-change', res => {
            if (res == 'paused') {
                setIsPlaying(false)
            } else {
                setIsPlaying(true)
            }
        })
    }, [])

    let _play = () => props.socket.emit('play');
    let _pause = () => props.socket.emit('pause');

    if (isPlaying) {
        return <i className="fas fa-pause fa-3x" onClick={_pause}></i>
    } else {
        return <i className="fas fa-play fa-3x" onClick={_play}></i>
    }
}

export default PlayPauseButton;