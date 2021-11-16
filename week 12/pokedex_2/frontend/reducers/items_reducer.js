import { RECEIVE_ONE_POKEMON } from "../actions/pokemon_actions";

const itemsReducer = (state = {}, action) => {
  console.log(action.items);
  Object.freeze(state);
  switch(action.type){
  case RECEIVE_ONE_POKEMON:
    return action.items;
  default:
    return state;
  }
}

export default itemsReducer;