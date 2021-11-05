import React from 'react';
import ReactDOM from 'react-dom';
import Clock from './frontend/clock';

let tabsArray = [{title:asdfg, content:fsdaf}]

document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("root");
  ReactDOM.render(<Clock/>, root);
});
