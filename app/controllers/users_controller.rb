class UsersController < ApplicationController
  def new
  end

  def create
    if params[:user].values.any? &:empty?
      
    else
      user=User.create(user_params)
      if user_params[:password] == user_params[:password_confirmation]
        
      else
        redirect_to user_new_path
      end
      session[:user_id] = user.id
    end
  end
  private
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
