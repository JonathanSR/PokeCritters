class PokemonsController < ApplicationController

  def show
    pokemon = params[:id]
    @show_pokemon = Pokemon.find_pokemon(pokemon)

    @species = Pokemon.find_species(pokemon)
    # byebug
  end
end