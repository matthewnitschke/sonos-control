import React, { useState, useEffect } from 'react';

import '../style/style.scss';

import RoomManager from './RoomManager.jsx';
import PlaybackControl from './PlaybackControl.jsx';

function SonosController(props) {

    return <div
        style={{
            display: 'flex'
        }}
    >
        <RoomManager mainDeviceRoomName="Office" socket={props.socket}/>
        <PlaybackControl socket={props.socket} />
    </div>
}

export default SonosController;