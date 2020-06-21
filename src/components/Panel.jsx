import React, { useState } from 'react';

function Panel(props) {
    let [isExpanded, setIsExpanded] = useState(false);

    let renderTrigger = () => {
        return <div className="panel-trigger" onClick={() => setIsExpanded(!isExpanded)}>
            <i className="fas fa-circle"></i>
            <i className="fas fa-circle"></i>
            <i className="fas fa-circle"></i>
        </div>
    }


    return <div className={`panel panel-${props.position}`}>
        { props.position == 'right' &&
            renderTrigger()
        }

        <div 
            className="panel-content"
            style={{display: isExpanded ? 'initial' : 'none'}}
        >{props.children}</div>
        
        { props.position == 'left' &&
            renderTrigger()
        }
        
    </div>
}

export default Panel