class PokemonService
attr_reader :connection

  def initialize 
    @connection = Faraday.new("http://pokeapi.co/api/v2/")
  end

  def get_pokemon
    parse(connection.get("pokemon/"))
  end

  def get_bulbasaur
    parse(connection.get("pokemon/1/"))
  end

  private
    def parse(response)
      JSON.parse(response.body, symbolize_names: true)
  end
end