class WelcomeController < ApplicationController
  def show
    @pokemon = Pokemon.find_starters
  end
end