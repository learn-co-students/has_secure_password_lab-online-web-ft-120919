class SessionsController < ApplicationController

    def new

    end

    def create
        @user = User.find_by(name: params[:user][:name])
        if !@user || !@user.authenticate(params[:user][:password])
            return head(:forbidden)
        else
            session[:user_id] = @user.id
        end
    end

end