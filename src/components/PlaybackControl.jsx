import React, {useState, useEffect} from 'react';

import PlayPauseButton from './PlayPauseButton.jsx';
import CurrentTrack from './CurrentTrack.jsx';
import VolumeSlider from './VolumeSlider.jsx';

function PlaybackControl(props) {
    let _next = () => props.socket.emit('next');
    let _previous = () => props.socket.emit('previous');

    return <div className="playback-control">
        <i className="fas fa-chevron-left fa-3x" onClick={_previous}></i>
        <PlayPauseButton socket={props.socket}/>
        <i className="fas fa-chevron-right fa-3x" onClick={_next}></i>
        <VolumeSlider socket={props.socket} />
        <CurrentTrack socket={props.socket} />
    </div>
}

export default PlaybackControl;