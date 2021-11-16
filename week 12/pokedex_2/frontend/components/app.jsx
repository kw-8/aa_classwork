import React from "react";
import { Route } from "react-router-dom";
import PokemonIndexContainer from './../components/pokemon/pokemon_index_container';
import PokemonDetail from "./pokemon/pokemon_detail";

const App = () => (
  <div className="app">
    <Route path="/" component={PokemonIndexContainer} />
    {/* <Route path="/pokemon/:id" component={PokemonDetailContainer} /> */}
  </div>
)

export default App;