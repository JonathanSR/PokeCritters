require 'rails_helper'

RSpec.feature "User" do
  context "successfull logout" do
    scenario "user logs out, session ends and is directed to root page" do
      user = create(:user)

      visit login_path

      fill_in "session[email]", with: user.email
      fill_in "session[password]", with: "password"
      click_button "Catch Em All"
      
      expect(page).to have_content("#{user.username}")
      expect(page).to have_content("Logout")
      expect(page).to_not have_content("Login")
    
      click_on "Logout"

      expect(page).to have_content("Logged Out")
      expect(current_path).to eq(root_path)
      expect(page).to_not have_content("#{user.username}")
      expect(page).to have_content("Login")
    end
  end
end
