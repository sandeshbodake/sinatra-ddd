import React from 'react';
import logo from './logo.svg';
import './App.css';

function App() {
  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo.svg" />
        <p id="greetings">
          Hello world :)
        </p>
      </header>
    </div>
  );
}

export default App;
