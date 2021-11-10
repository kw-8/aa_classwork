import React from "react";
import ReactDOM from "react-dom";
import configureStore from '../todos/frontend/store/store';
import * as todo_actions from '../todos/frontend/actions/todo_actions'


document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("content");
  const preloadedState = { "k": "v" };
  const store = configureStore(preloadedState); // createStore
  window.store = store;
  window.receiveTodo = todo_actions.receiveTodo;
  window.receiveTodos = todo_actions.receiveTodos;
  // debugger;
  ReactDOM.render(<h1>Todos App</h1>, root);
})

