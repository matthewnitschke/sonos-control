import React, { useEffect, useState } from 'react'

function useSpotify() {
    let [library, setLibrary] = useState([])
    useEffect(() => {
        fetch('/spotify-library')
            .then((resp) => resp.json())
            .then((data) => setLibrary(data.body.items))
    }, [])

    return library
}

export default useSpotify;