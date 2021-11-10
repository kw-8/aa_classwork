import React from "react";
import ReactDOM from "react-dom";
import { combineReducers } from "redux";
import configureStore from '../todos/frontend/store/store';
// import todosReducer from './frontend/reducers/todos_reducer'


document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("content");
  const preloadedState = { "k": "v" };
  const store = configureStore(preloadedState);
  window.store = store;
  // debugger;
  ReactDOM.render(<h1>Todos App</h1>, root);
})