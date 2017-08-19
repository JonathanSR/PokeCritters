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
        # expect(poke_data.count).to eq(3)

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

  describe "it gets the species evolution chain" do
    it "returns the bulbasaur evolution chain as models" do
    pokemon_evolutions = Pokemon.find_species(1)
    bulbasaur = pokemon_evolutions[0]
    ivysaur = pokemon_evolutions[1]
    venusaur = pokemon_evolutions[2]
    

    expect(pokemon_evolutions.class).to eq(Array)
    # expect(pokemon_evolutions.count).to eq(3)
    expect(bulbasaur.class).to eq(Pokemon)
    
    expect(bulbasaur.name).to eq("bulbasaur")
    expect(ivysaur.name).to eq("ivysaur")
    expect(venusaur.name).to eq("venusaur")
    end
  end

describe "it goes through the evolution chain return" do
  
  before(:each) do
    @service = PokemonService.new
    @find_evolutions = Pokemon.find_evolutions("evolution-chain/1/")
  end

  it "returns the name of the pokemon in that evolution chain " do
    evolutions = @service.main_connect("evolution-chain/1/")
 
    first = Pokemon.first(evolutions)
    expect(first.last).to eq("bulbasaur")

    middle = Pokemon.middle(evolutions)
    expect(middle.last).to eq("ivysaur")

    last = Pokemon.last(evolutions)
    expect(last.last).to eq("venusaur")
  end
end