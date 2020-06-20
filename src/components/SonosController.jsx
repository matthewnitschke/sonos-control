import React, { useState, useEffect } from 'react';

import '../style/style.scss';

import PlaybackControl from './PlaybackControl';
import CurrentTrackDesc from './CurrentTrackDesc';
import CurrentTrackArt from './CurrentTrackArt';
import VolumeSlider from './VolumeSlider';
import Panel from './Panel';
import RoomManager from './RoomManager';

function SonosController() {
    

    return <div className="main-container">
        <Panel position="left">
            <RoomManager mainDeviceRoomName="Office"/>
        </Panel>

        <CurrentTrackArt />

        <div className="right-panel">
            <CurrentTrackDesc />
            <PlaybackControl />
            <VolumeSlider />
        </div>
    </div>
}

export default SonosController