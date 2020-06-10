import React, {useState, useEffect} from 'react'

function CurrentTrack(props) {
    let [currentTrack, setCurrentTrack] = useState({})

    useEffect(() => {
        props.socket.on('current-track-change', res => {
            setCurrentTrack(res)
        })
    }, [])

    return `${currentTrack.title} - ${currentTrack.artist}`
    
}

export default CurrentTrack;