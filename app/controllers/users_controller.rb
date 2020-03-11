class UsersController < ApplicationController
    

  def create
    @user = User.create(user_params)
    if @user.valid?
      session[:user_id] = @user.id
      redirect_to :welcome
    else
      redirect_to :new_user
    end
  end

     
      private
     
      def user_params
        params.require(:user).permit(:username, :password, :password_confirmation)
      end
end
