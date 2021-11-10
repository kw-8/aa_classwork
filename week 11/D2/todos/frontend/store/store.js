import { createStore } from "redux";
import rootReducer from "../reducers/root_reducer";

const configureStore = (preloadedState={}) => {
  return createStore(rootReducer, preloadedState);
} // rootReducer returns new value of state of store

export default configureStore;