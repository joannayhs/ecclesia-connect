class UsersController < ApplicationController

    def new
        @user = User.new 
    end 

    def create
        @user = User.find_or_create_by(:email params[:user][:email])
        redirect_to user_path(@user)
    end 

    def show 
        @user = User.find(params[:id])
    end 

    private 
    
    def user_params 
        params.require(:user).permit(:email, :password)
    end
end
