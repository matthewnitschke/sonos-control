import React, {useState, useEffect} from 'react'

function CurrentTrack(props) {
    let [currentTrack, setCurrentTrack] = useState({})

    useEffect(() => {
        props.socket.on('current-track-change', res => {
            console.log(res)
            setCurrentTrack(res)
        })
    }, [])

    return <div className="current-track">
        <div 
            className="album-artwork"
            style={{backgroundImage: `url(${currentTrack.albumArtURI})`}}
        ></div>
        <div className="track-text">
            <div>
                <div>{currentTrack.title}</div>
                <div>{currentTrack.artist}</div>
            </div>
        </div>
    </div>
    
}

export default CurrentTrack;