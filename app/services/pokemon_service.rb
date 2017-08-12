class PokemonService
attr_reader :connection

  def initialize 
    @connection = Faraday.new("http://pokeapi.co/api/v2/")
  end

  def get_pokemon_list
    parse(connection.get("pokemon/"))
  end

  def get_pokemon(id)
    parse(connection.get("pokemon/#{id}/"))
  end

  private
    def parse(response)
    # byebug
      JSON.parse(response.body, symbolize_names: true)
  end
end