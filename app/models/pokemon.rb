class Pokemon
  attr_reader :name,
              :weight,
              :height,
              :type_1,
              :type_2,
              :image,
              :id

  def initialize(poke_data)
    @name = poke_data[:name] 
    @weight = poke_data[:weight] 
    @height = poke_data[:height]
    @type_1 = check_type_1_exists(poke_data)
    @type_2 = poke_data[:types][0][:type][:name]
    @image = poke_data[:sprites][:front_default]
    @id = poke_data[:id]
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
    url = poke_service.get_species(id)
    data = url[:evolution_chain][:url]
    find_evolutions(data)
  end

  def self.find_evolutions(url)
    critters = []
    evolutions = poke_service.main_connect(url)
    if !evolutions[:chain][:species].nil?
      first = critters.push(evolutions[:chain][:species][:name])
    else
    end

    if !evolutions[:chain][:evolves_to][0].nil?
      middle = critters.push(evolutions[:chain][:evolves_to][0][:species][:name])
    else
    end

    if !evolutions[:chain][:evolves_to][0][:evolves_to][0].nil?
      final = critters.push(evolutions[:chain][:evolves_to][0][:evolves_to][0][:species][:name])
    else
    end
      
      poke_array = []
      critters.each do |critter|
        data = poke_service.get_pokemon(critter)
        poke_array.push(Pokemon.new(data))
      end
      poke_array
  end
end