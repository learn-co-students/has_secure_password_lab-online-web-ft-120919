class UsersController < ApplicationController

  # get signup form
  def new
  end

  # post signup form
  def create
    if params[:user][:password] == params[:user][:password_confirmation]
      @user = User.create(user_params)
      session[:user_id] = @user.id
      redirect_to 'home'
    else
      redirect_to new_user_path
    end
  end

  # get home page
  def home
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end