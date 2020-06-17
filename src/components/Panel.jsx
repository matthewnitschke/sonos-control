import React, { useState } from 'react';

function Panel(props) {
    let [isExpanded, setIsExpanded] = useState(false);

    return <div className="panel">
        <div 
            className="panel-content"
            style={{display: isExpanded ? 'initial' : 'none'}}
        >{props.children}</div>
        
        <div className="panel-trigger" onClick={() => setIsExpanded(!isExpanded)}>
            <i className="fas fa-circle"></i>
            <i className="fas fa-circle"></i>
            <i className="fas fa-circle"></i>
        </div>
    </div>
}

export default Panel