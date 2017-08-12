require 'rails_helper'

describe "pokemon class" do
  context "find a certain pokemon" do
    it "returns the bulbasaur starter pokemon" do

      pokemon = Pokemon.find_pokemon(1)

      expect(pokemon.class).to eq(Pokemon)
      expect(pokemon.name).to eq("bulbasaur")
      expect(pokemon.weight).to eq(69)
      expect(pokemon.height).to eq(7)
      expect(pokemon.type_1).to eq("grass")
      expect(pokemon.type_2).to eq("poison")
      expect(pokemon.image).to be_truthy
    end
  end
end

  describe "checks if JSON object contains type_1 and type_2" do
    before(:each) do
      @service = PokemonService.new
    end

  context "searches the Charmander object for types" do
    it "returns a one type only message" do
      poke_data = @service.get_pokemon(4)
      pokemon = Pokemon.new(poke_data)

      type = pokemon.check_type_1_exists(poke_data)
     
      expect(type).to eq("Pokemon only has one type")
    end
  end

  context "searched the Bulbasaur object for types" do
    it "returns the second type in the array" do
      poke_data = @service.get_pokemon(1)
      pokemon = Pokemon.new(poke_data)

      type = pokemon.check_type_1_exists(poke_data)
     
      expect(type).to eq("grass")
    end
  end
end

describe "create a collection of starters" do
  context "gets first gen starter pokemon" do
    it "returns a collection of three" do
        poke_data = Pokemon.find_starters
        bulbasaur = poke_data[0]
        charmander = poke_data[1]
        squirtle = poke_data[2]
        

        expect(poke_data.class).to eq(Array)
        expect(poke_data.count).to eq(3)

        expect(charmander.name).to eq("charmander")
        expect(squirtle.name).to eq("squirtle")
        expect(bulbasaur.name).to eq("bulbasaur")

        expect(bulbasaur.class).to eq(Pokemon)
        expect(bulbasaur.weight).to eq(69)
        expect(bulbasaur.height).to eq(7)
        expect(bulbasaur.type_1).to eq("grass")
        expect(bulbasaur.type_2).to eq("poison")
        expect(bulbasaur.image).to be_truthy
    end
  end
end