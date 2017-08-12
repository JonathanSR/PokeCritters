class Pokemon
  attr_reader :name,
              :weight,
              :height,
              :type_1,
              :type_2

  def initialize(poke_data)
    @name = poke_data[:name]
    @weight = poke_data[:weight]
    @height = poke_data[:height]
    @type_1 = poke_data[:types][1][:type][:name]
    @type_2 = poke_data[:types][0][:type][:name]
  end

  def self.find_bulbasaur
   poke_data = poke_service.get_bulbasaur
    Pokemon.new(poke_data)
  end

  def self.poke_service
    PokemonService.new
  end

end