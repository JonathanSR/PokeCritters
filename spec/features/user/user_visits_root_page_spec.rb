require 'rails_helper'

describe "User visits root page" do
  context "sees starter list of pokemon" do
    it "clicks on pokemon and gets taken to pokemon show page" do

      visit '/'

      expect(page).to have_content("PokeCritters")
      expect(page).to have_content("Charmander")
      expect(page).to have_content("Bulbasaur")
      expect(page).to have_content("Squirtle")
      
      click_on "Bulbasaur"

      expect(current_path).to eq("/pokemons/1")

      expect(page).to have_content("Bulbasaur")
    end
  end
end