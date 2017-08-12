require 'rails_helper'

context "find a certain pokemon" do
    it "returns the bulbasaur starter pokemon" do

      pokemon = Pokemon.find_bulbasaur
# byebug
      expect(pokemon.class).to eq(Pokemon)
      expect(pokemon.name).to eq("bulbasaur")
      expect(pokemon.weight).to eq(69)
      expect(pokemon.height).to eq(7)
      expect(pokemon.type_1).to eq("grass")
      expect(pokemon.type_2).to eq("poison")
    end
  end

