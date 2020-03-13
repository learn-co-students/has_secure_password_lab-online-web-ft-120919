class WelcomeController < ApplicationController

    def index
    end 

    def require_login
        redirect_to '/login' unless session.include?(:user_id)
    end 
end 