import React, {useState, useEffect} from 'react';

import { usePlayState } from '../hooks/useSonos.js'

function PlayPauseButton() {
    let [ isPlaying, setIsPlaying ] = usePlayState()

    if (isPlaying) {
        return <i className="fas fa-pause fa-3x" onClick={() => setIsPlaying(false)}></i>
    }

    return <i className="fas fa-play fa-3x" onClick={() => setIsPlaying(true)}></i>
}

export default PlayPauseButton