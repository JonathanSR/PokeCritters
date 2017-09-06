require 'rails_helper'

RSpec.feature "User" do
  context "appropriate login" do
    scenario "user logs in and is directed to their dashboard" do
      user = create(:user)

      visit login_path

      fill_in "session[email]", with: user.email
      fill_in "session[password]", with: user.password

      click_button "Catch Em All"

      expect(current_path).to eq(pokedex_path)
      expect(page).to have_content("#{user.username}'s Pokedex")
      expect(page).to_not have_content("Login")
      expect(page).to have_link("Logout")
    end
  end
end