import React from "react";
import ReactDOM from "react-dom";

// import io from 'socket.io-client'

import SonosController from './components/SonosController.jsx';

// import {
//     SonosAPIAdapter,
//     SonosAPIContext,
// } from './sonosApiAdapter.js'

// var socket = io();

// const apiAdapter = SonosAPIAdapter();

ReactDOM.render(
    <SonosController />,
    document.getElementById("app")
);