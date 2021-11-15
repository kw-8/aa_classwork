import React from "react";
import PokemonIndexItem from "./pokemon_index_item";

class PokemonDetail extends React.Component {
  constructor(props){
    super(props)

  }

  render(){

    return(
      <section className="detail">
        <ul>
          {this.props.pokemon.id}
        </ul>
      </section>
    )
  }
}

export default PokemonDetail;