import React from "react";
import ReactDOM from "react-dom";

import io from 'socket.io-client'

import SonosController from './components/SonosController.jsx';

import { Provider } from 'react-redux'

import store from './store'

var socket = io();

ReactDOM.render(
    <Provider store={store}>
        <SonosController socket={socket} />,
    </Provider>,
    document.getElementById("app")
);