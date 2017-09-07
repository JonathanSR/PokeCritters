require 'rails_helper'

RSpec.feature "User" do

  before(:each) do 
      @user = create(:user)
  end

  context "appropriate login" do
    scenario "user logs in and is directed to their dashboard" do

      visit login_path

      fill_in "session[email]", with: @user.email
      fill_in "session[password]", with: @user.password

      click_button "Catch Em All"

      expect(current_path).to eq(pokedex_path)
      expect(page).to have_content("#{@user.username}'s Pokedex")
      expect(page).to_not have_content("Login")
      expect(page).to have_link("Logout")
    end
  end

  context "unsuccessful" do
    scenario "user tries to log in with invalid credentials" do

      visit login_path

      fill_in "session[email]", with: @user.email
      fill_in "session[password]", with: "fail"
      click_button "Catch Em All"

      expect(current_path).to eq(login_path)
      expect(page).to have_content("Incorrect entry")
    end
  end
end