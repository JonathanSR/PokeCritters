require 'rails_helper'

describe "User visits root page" do
  before(:each) do
    pokemon_1 =   Pokemon.get_bulbasaur
  end

  context "sees starter list of pokemon" do
    it "clicks on pokemon and gets taken to pokemon show page" do

      visit '/'

      expect(page).to have_content("PokeCritters")
      expect(page).to have_content("Charizard")
      expect(page).to have_content("Bulbasaur")
      expect(page).to have_content("Squirtle")
      
      click_on "Charizard"

      expect(current_path).to eq("/charizard")

      expect(page).to have_content("Charizard")
    end
  end
end