class UsersController < ApplicationController
    before_action :get_user, only: [:show, :update]

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
            render :show
        else 
            redirect_to profile_path(current_user), alert: "Unauthorized to see this page"
        end 
    end 

    def update 
        @user.update(params.require(:user).permit(:admin))
        if @user.save 
            redirect_to user_path(@user)
        else 
            redirect_to user_path(@user)
            flash[:alert] = "There was an error"
        end 
    end

    private 
    
    def user_params 
        params.require(:user).permit(:name, :email, :password, :uid, :admin)
    end

    def get_user
        @user = User.find(params[:id])
    end 
 
end
