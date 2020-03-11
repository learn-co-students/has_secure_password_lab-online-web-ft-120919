class UsersController < ApplicationController
  before_action :require_login, only: [:welcome]

  def welcome
    @user = current_user
    #render welcome page
  end

  def new
    #render signup page
  end

  def create
    @user = User.new(user_params)
    saved = @user.try(:save)
    if !saved 
      flash[:alert] = "Passwords did not match"
      return redirect_to new_user_path
    end

    session[:user_id] = @user.id
    redirect_to :welcome
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
