import React from 'react';

import { useSonosActions } from '../hooks/useSonos.js'

import PlayPauseButton from './PlayPauseButton.jsx';

function PlaybackControl(props) {
    let { next, previous } = useSonosActions()

    return <div className="playback-control">
        <i className="fas fa-chevron-left fa-3x" onClick={previous}></i>
        <PlayPauseButton socket={props.socket}/>
        <i className="fas fa-chevron-right fa-3x" onClick={next}></i>
    </div>
}

export default PlaybackControl;