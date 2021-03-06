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


  def get_species(id)
    parse(connection.get("pokemon-species/#{id}/"))
  end

  def get_evolutions(id)
    parse(connection.get("evolution-chain/#{id}/"))
  end

  def main_connect(url)
    result = parse(connection.get("#{url}"))
  end

  private
    def parse(response)
      JSON.parse(response.body, symbolize_names: true)
  end
end