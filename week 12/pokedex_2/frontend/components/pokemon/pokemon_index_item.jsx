import React from "react";
import { Link } from "react-router-dom";
// {poke} === props.poke
const PokemonIndexItem = ({poke}) => (
  <li className="pokemon-index-item">
    <Link to={`/pokemon/${poke.id}`}>
      <span>{poke.id}</span>
      <img src={poke.imageUrl} />
      <span>{poke.name}</span>
    </Link>
  </li>
)

export default PokemonIndexItem;