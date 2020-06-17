import React, {useState, useEffect} from 'react'

import { useCurrentTrack } from '../hooks/useSonos.js'

function CurrentTrackDesc() {
    let currentTrack = useCurrentTrack();    

    return <div 
        className="current-track__art"
        style={{backgroundImage: `url(${currentTrack.albumArtURI})`}}>
    </div>
}

export default CurrentTrackDesc;