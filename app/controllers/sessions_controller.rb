class SessionsController < ApplicationController

  def create
    @user = User.find_by name: params[:user][:name]
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to welcome_path
    else
      redirect_to new_session_path
    end
  end

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
