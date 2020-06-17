import React, {useState, useEffect} from 'react'

import { useCurrentTrack } from '../hooks/useSonos.js'

function CurrentTrackDesc() {
    let currentTrack = useCurrentTrack();    

    return <div className="current-track__desc">
        <div className="track-name">{currentTrack.title}</div>
        <div className="artist-name">{currentTrack.artist}</div>
    </div>

    // return <div className="current-track">
    //     <div 
    //         className="album-artwork"
    //         style={{backgroundImage: `url(${currentTrack.albumArtURI})`}}
    //     ></div>
    //     <div className="track-text">
    //         <div>
    //             <div>{currentTrack.title}</div>
    //             <div>{currentTrack.artist}</div>
    //         </div>
    //     </div>
    // </div>
    
}

export default CurrentTrackDesc;