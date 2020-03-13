# frozen_string_literal: true

class SessionsController < ApplicationController
  def create
    @user = User.find_by(name: 'Connie')
    # byebug
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
    else
      redirect_to users_create_path
    end

    # byebug
  end
end
