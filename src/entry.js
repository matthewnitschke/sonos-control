import React from "react";
import ReactDOM from "react-dom";

import io from 'socket.io-client'

import SonosController from './components/SonosController.jsx';

var socket = io();

ReactDOM.render(
    <SonosController socket={socket} />,
    document.getElementById("app")
);