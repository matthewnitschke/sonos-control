import React, {useEffect, useState} from 'react';

import { useCurrentTopology } from '../hooks/useSonos.js'

function RoomManager(props) {

    // let [data, setData] = useState([])
    
    // useEffect(() => {
    //     props.socket.on('topology-change', res => {
    //         // if eventBody is empty, the topo change had nothing to do with
    //         // the main device
    //         if (Object.entries(res.eventBody).length > 0) {
    //             console.log(res)
    //             let topData = res.eventBody.ZoneGroupState.ZoneGroupState.ZoneGroups.ZoneGroup

    //             if (topData.length === undefined) {
    //                 topData = [topData]
    //             }

    //             setData(topData)
    //         }
    //     })
    // }, [])

    let data = useCurrentTopology();

    let mainDeviceGroup = [];
    let otherDevices = [];
    data.forEach(group => {
        let isMain = false;

        group.ZoneGroupMember.forEach(zoneMember => {
            if (zoneMember.ZoneName == props.mainDeviceRoomName) {
                isMain = true;
            }
        })

        if (!isMain) {
            otherDevices = otherDevices.concat(group.ZoneGroupMember)
        } else {
            mainDeviceGroup = group.ZoneGroupMember;
        }
    })

    let nonMainDevices = mainDeviceGroup
        .concat(otherDevices)
        .filter(zoneMember => zoneMember.ZoneName != props.mainDeviceRoomName)
    
    nonMainDevices.sort((a, b) => {
        return a.ZoneName.localeCompare(b.ZoneName)
    });

    
    let _handleZoneChange = (e, zoneMember) => {
        let action = e.target.checked ? 'add' : 'remove';
        fetch(`/groups/${zoneMember.ZoneName}/${action}`)
    }

    return <div>
        <div>{props.mainDeviceRoomName}</div>
        {
           nonMainDevices.map(zoneMember => 
                <div key={zoneMember.ZoneName}>
                    <input 
                        type="checkbox" 
                        checked={mainDeviceGroup.includes(zoneMember)}
                        id={zoneMember.ZoneName}
                        onChange={(e) => _handleZoneChange(e, zoneMember)}
                        /> <label htmlFor={zoneMember.ZoneName}>{zoneMember.ZoneName}</label>
                </div>
            )
        }
    </div>
}

export default RoomManager;