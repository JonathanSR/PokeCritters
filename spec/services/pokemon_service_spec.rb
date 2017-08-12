require 'rails_helper'

describe PokemonService do
  attr_reader :service 

  before(:each) do
    @service = PokemonService.new
  end

  it "returns a list of 20 pokemon" do
      pokemons = service.get_pokemon_list[:results]
      pokemon = pokemons[0]

      expect(pokemons.class).to eq(Array)
      expect(pokemons.count).to eq(20)

      expect(pokemon[:name]).to be_truthy
      expect(pokemon[:url]).to be_truthy
    end

  context "find a certain pokemon" do
    it "returns the bulbasaur starter pokemon" do
      pokemon = service.get_pokemon(1)
      expect(pokemon.class).to eq(Hash)
      expect(pokemon[:name]).to eq("bulbasaur")
      expect(pokemon[:weight]).to eq(69)
      expect(pokemon[:height]).to eq(7)
      expect(pokemon[:types][0][:type][:name]).to be_truthy
      expect(pokemon[:types][1][:type][:name]).to be_truthy
      expect(pokemon[:sprites][:front_default]).to be_truthy
    end
  end
end

