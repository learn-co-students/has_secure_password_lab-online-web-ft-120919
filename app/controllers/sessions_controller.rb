class SessionsController < ApplicationController
  
  def new
    #render login form
  end

  def create
    #find user
    @user = User.find_by(name: params[:user][:name])
    authenticated = @user.try(:authenticate, params[:user][:password])

    if !authenticated 
      flash[:alert] = "Failure to authenticate user"
      return redirect_to :login
    end

    session[:user_id] = @user.id
    redirect_to :welcome
  end

  def destroy
    session.clear
    flash[:alert] = "You have been logged out."
    redirect_to :login
  end
end
