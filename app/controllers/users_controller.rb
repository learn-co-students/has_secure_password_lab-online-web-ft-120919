class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create user_params
    #binding.pry
    if @user.errors.any?
      redirect_to new_user_path
    elsif @user.valid? && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to '/welcome'
    else
      redirect_to new_session_path
    end
  end

  def welcome

  end

private

def user_params
  params.require(:user).permit(:name, :password, :password_confirmation)
end

end
