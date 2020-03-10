class SessionsController < ApplicationController
    def new
    end
  
    def create
      @user = User.find_by(:name => params[:user][:name])
     # return head(:forbidden) unless @user.authenticate(params[:password])
      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to '/'
      else
        redirect_to :login
      end
    end
  
    def destroy
        if session[:name].present?
            session.delete :name
          end
    end
  end