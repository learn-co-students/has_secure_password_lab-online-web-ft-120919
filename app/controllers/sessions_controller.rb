class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    #binding.pry 
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id 
      #binding.pry 
      redirect_to user_path(@user)
    else
      redirect_to controller: 'sessions', action: 'new'
    end
    #return head(:forbidden) unless @user.authenticate(params[:password])
  end
end