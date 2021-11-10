export const RECEIVE_TODOS = "RECEIVE_TODOS"; //throws errors on type
export const RECEIVE_TODO = "RECEIVE_TODO";

export const receiveTodos = (todos) => {
  return {
    type: RECEIVE_TODOS,
    todos, // an array of todos
  }
}

export const receiveTodo = (todo) => {
  return {
    type: RECEIVE_TODO,
    todo,
  }
}