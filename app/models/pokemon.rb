class Pokemon
  attr_reader :name,
              :weight,
              :height,
              :type_1,
              :type_2,
              :image

  def initialize(poke_data)
    @name = poke_data[:name] 
    @weight = poke_data[:weight] 
    @height = poke_data[:height]
    @type_1 = check_type_1_exists(poke_data)
    @type_2 = poke_data[:types][0][:type][:name]
    @image = poke_data[:sprites][:front_default]
  end

  def self.find_pokemon(id)
   poke_data = poke_service.get_pokemon(id)
    Pokemon.new(poke_data)
  end

  def self.poke_service
    PokemonService.new
  end

  def check_type_1_exists(poke_data)
    if !poke_data[:types][1].nil?
      poke_data[:types][1][:type][:name]
    else
      "Pokemon only has one type"
    end
  end

  def self.find_starters
    poke_array = [ ]
    [1,4,7].each do |id|
      data = poke_service.get_pokemon(id)
      poke_array.push(Pokemon.new(data))
    end
    poke_array
  end

  def self.find_species(id)
    poke_service.get_species(id)
  end

  def find_evolutions

  end
end