require 'rails_helper'

RSpec.feature "User" do
  context "appropriate login" do
    scenario "user logs in and is directed to their dashboard" do
      