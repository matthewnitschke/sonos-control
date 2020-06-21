import React, { useEffect } from 'react'

import useSpotify from '../hooks/useSpotify.js';

import {useSonosActions} from '../hooks/useSonos.js';

function SpotifyLibrary() {
    let library = useSpotify()
    console.log(library)

    let { playUserPlaylist } = useSonosActions()

    return <div className="spotify-library">
        <div className="header">Playlists</div>
        {library.map((data) => {
            return <div 
                className="playlist-item"
                onClick={() => playUserPlaylist(data.uri)}
            >{data.name}</div>
        })}
    </div>
}

export default SpotifyLibrary;