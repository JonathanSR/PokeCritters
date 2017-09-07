require 'rails_helper'

RSpec.feature "Guest" do
  context "create account" do
    scenario "guest visits new user page and creates account" do

      visit new_user_path

      fill_in "user[first_name]", with: "Jon"
      fill_in "user[last_name]", with: "Snow"
      fill_in "user[email]", with: "jon.snow@winterfell.com"
      fill_in "user[username]", with: "KINGINDANORF"
      fill_in "user[password]", with: "password"
      fill_in "user[password_confirmation]", with: "password"

      expect { click_on "Join Now"}.to change(User, :count).by(1)

      expect(current_path).to eq(pokedex_path)
      expect(page).to have_content("KINGINDANORF's Pokedex")
      expect(page).to_not have_content("Login")
      expect(page).to have_content("Logout")
    end
  end
end
      