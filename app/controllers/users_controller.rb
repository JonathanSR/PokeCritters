class UsersController < ApplicationController

  def index
    @user = current_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id 
      redirect_to pokedex_path
      flash[:success] = "You're in the great game now'"
    else
      render :new
      flash[:danger] = "Something Went Wrong, Try Again."
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :first_name, :last_name, :email, :password)
  end
end