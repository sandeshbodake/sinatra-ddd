import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
import App from './App';
import * as serviceWorker from './serviceWorker';


ReactDOM.render(<App />, document.getElementById('index'));

// If you want your app to work offline and load faster, you can change
// unregister() to register() below. Note this comes with some pitfalls.
// Learn more about service workers: https://bit.ly/CRA-PWA
serviceWorker.unregister();

require(path.resolve(__dirname, '/') + 'favicon.ico');
require(path.resolve(__dirname, '/') + 'logo192.png');
require(path.resolve(__dirname, '/') + 'logo512.png');