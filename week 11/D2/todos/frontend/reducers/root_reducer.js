import todosReducer from "./todos_reducer";
import configureStore from '../store/store';
import { combineReducers } from "redux";



const rootReducer = (state = {}, action) => {
  return todosReducer(state, action);
}

export default rootReducer;