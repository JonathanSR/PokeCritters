class PokemonsController < ApplicationController

  def show
    pokemon = params[:id]
    @species = Pokemon.find_species(pokemon)
  end
end