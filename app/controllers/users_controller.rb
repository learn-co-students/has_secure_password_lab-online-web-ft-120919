#  require 'pry'
class UsersController < ApplicationController
    
def new 
   
end 
  def create
    
    
    @user = User.create(user_params)
    # binding.pry
    @user.save
    if @user.valid?
      session[:user_id] = @user.id
      redirect_to :welcome
    else
      redirect_to :new_user
    end
  end

     
      private
     
      def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
      end
end
