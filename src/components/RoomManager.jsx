import React, {useEffect, useState} from 'react';

import { useCurrentTopology } from '../hooks/useSonos.js'

function RoomManager(props) {
    let [devices, addDevice, removeDevice] = useCurrentTopology(props.mainDeviceRoomName);
    
    let _handleZoneChange = (e, deviceName) => {
        let isChecked = e.target.checked;

        if (isChecked) {
            addDevice(deviceName)
        } else {
            removeDevice(deviceName)
        }
    }

    // sort so that they are always in the same order
    let deviceNames = Object.keys(devices)
    deviceNames.sort((a, b) => {
        return a.localeCompare(b)
    });

    return <div className="devices-panel">
        <div className="main-device-title">{props.mainDeviceRoomName}</div>
        {
           deviceNames.map(deviceName => 
                <div key={deviceName}>
                    <input 
                        type="checkbox" 
                        checked={devices[deviceName]}
                        id={deviceName}
                        onChange={(e) => _handleZoneChange(e, deviceName)}
                        /> <label htmlFor={deviceName}>{deviceName}</label>
                </div>
            )
        }
    </div>
}

export default RoomManager;