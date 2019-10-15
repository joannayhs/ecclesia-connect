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

    def show 
        if !current_user.nil?
            get_user
        else 
            redirect_to new_user_path
        end  

    end 

    private 
    
    def user_params 
        params.require(:user).permit(:name, :email, :password, :uid)
    end
    
    def get_user 
        @user = current_user
    end 

end
