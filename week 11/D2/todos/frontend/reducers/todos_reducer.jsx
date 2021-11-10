import RECEIVE_TODOS from '../actions/todo_actions';
import RECEIVE_TODO from '../actions/todo_actions';
import configureStore from '../store/store';


// default
const initialState = {
  1: {
    id: 1,
    title: "wash car",
    body: "with soap",
    done: false
  },
  2: {
    id: 2,
    title: "wash dog",
    body: "with shampoo",
    done: true
  }
};

const todosReducer = (state={}, action) => {
  Object.freeze(state);
  const nextState = Object.assign({}, state);

  switch(action.type) {
    case RECEIVE_TODOS:
      // console.log(store);
      // return {"icecream":"vanilla"}
    // let todoR = {};
    action.todos.forEach( ele => {
      nextState[ele.id] = ele.title 
    })
    //   const store = configureStore(preloadedState);
    //   window.store = store;
      // nextState[action.tea.id] = action.todos;
      // return nextState;
    case RECEIVE_TODO:
      action.todos.forEach(ele => {
        nextState[ele.id] = ele.title
      })
      nextState[action.tea.id] = action.todos;
      return nextState;
      // console.log(store);
      // return { "icecream": "chocolate" }
    default:
      return state;
      // return {"banana":"bread"}
  }

}
export default todosReducer;
