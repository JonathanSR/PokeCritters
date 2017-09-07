class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: session_params[:email])
    if user && user.authenticate(session_params[:password])
      session[:user_id] = user.id
      flash[:success] = "#{user.username} Has Successfully Logged In"
      redirect_to pokedex_path
    else
      flash[:error] = "Incorrect entry"
      redirect_to login_path
    end
  end

  def destroy
    session.clear
    flash[:success] = "Logged Out"
    redirect_to root_path
  end

  private
  
  def session_params
    params.require(:session).permit(:email, :password)
  end
end