class SessionsController < ApplicationController

  # get login form
  def new
  end

  # post login form
  def create
    @user = User.find_by_name(params[:user][:name])
    return head(:forbidden) unless @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    redirect_to controller: 'users', action: 'home'
  end

  # post logout
  def destroy
    session.clear
    redirect_to controller: 'sessions', action: 'new'
  end

end