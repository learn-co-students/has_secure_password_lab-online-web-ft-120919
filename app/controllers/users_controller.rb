class UsersController < ApplicationController 

    def show
        # debugger
        # binding.pry

        @user = User.find_by(id: params[:id])
        # redirect_to '/signin' if !session[:user_id] || @user.password != @user.password_confirmation
        # redirect_to new_user_path if !session[:user_id] 
        # redirect_to user_path(user)
    end

    def new
        @user = User.new 
    end

    def create
        user = User.create(user_params)
        session[:user_id] = user.id
        if user.password == user.password_confirmation
            # binding.pry
            redirect_to user_path(user)
        else
            redirect_to new_user_path
        end
    end
        # @user = User.create(user_params)
        # if @user.password != @user.password_confirmation
        #     session[:user_id] = @user.id
        #     # debugger
        #     redirect_to user_path(@user) 
        # else
        #     redirect_to new_user_path
        # end
        
        # if user_params 
        #     @user = User.create(user_params)
        #     if @user.password != @user.password_confirmation
        #         session[:user_id] = @user.id
        #         # debugger
        #         redirect_to user_path(@user) 
        #     else
        #         redirect_to new_user_path
    
        #     end
        # else 
        #     redirect_to '/'
        # end
        
    
     
    private
    
    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end



end