class UsersController < ApplicationController
  
    def index 
        @users = User.all
    end 

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
        if current_user.admin?
            @user = User.find_by(id: params[:id])
        else 
            redirect_to profile_path(current_user), alert: "Unauthorized to see this page"
        end 
    end 

    def update 
        @user = User.find(params[:id]) 
        if @user.update(user_params)
            redirect_to user_path(@user)
        else 
            render 'users/show'
        end 
    end

    private 
    
    def user_params 
        params.require(:user).permit(:name, :email, :password, :uid, :admin )
    end
 
end
