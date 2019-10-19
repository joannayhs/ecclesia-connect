class UsersController < ApplicationController
  

    def new
        @user = User.new 
    end 

    def create
        @user = User.new(user_params)
        if @user.save
            login(@user)
        else 
            render :new  
        end 
    end 

    def  profile 
        @user = current_user
        render :show
    end 

    def show 
        @user = User.find_by(id: params[:id])
    end 

    private 
    
    def user_params 
        params.require(:user).permit(:name, :email, :password, :uid)
    end
 
end
