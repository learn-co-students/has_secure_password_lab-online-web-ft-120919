class WelcomeController < ApplicationController
    def welcome
        render :'/welcome/hello'
    end
end