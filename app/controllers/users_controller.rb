class UsersController < ApplicationController

  def index
    @user = User.find_by(id: session[:user_id])
    # byebug 
  end

end