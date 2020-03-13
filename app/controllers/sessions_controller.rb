class SessionsController < ApplicationController


    def new
    end 

    def create 
        @user = User.find_by(name: params[:user][:name])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to '/'
        end 
    end 

    def logged_in?
        !!session[:user_id]
    end 

    def destroy
        if logged_in?
        session.delete(:user_id)
        redirect_to '/login'
        end 
    end 
end 