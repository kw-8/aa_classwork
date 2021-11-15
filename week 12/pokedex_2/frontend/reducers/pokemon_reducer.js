import { RECEIVE_ALL_POKEMON } from './../actions/pokemon_actions';


const pokemonReducer = (state = {}, action) => {
  Object.freeze(state);
  switch (action.type){
  case RECEIVE_ALL_POKEMON:
    return Object.assign({}, action.pokemon, state);
  case RECEIVE_ONE_POKEMON:
    let newState = Object.assign({}, state);
    // {entities: {pokemon: {1:{}, 2:{},..}}}
    newState.pokemon[action.pokemon]
  default:
    return state;
  }
}
  
export default pokemonReducer;
