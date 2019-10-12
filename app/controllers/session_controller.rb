class SessionController < ApplicationController
  def new 
    render 'welcome/home'
  end 
  
  def create
    @user = User.find_by(email: params[:user][:email])
    if @user && @user.authenticate(params[:user][:password]) 
      session[:user_id] = @user.id 
      redirect_to user_path(@user)
    else 
      redirect_to new_user_path
    end 
  end

  def destroy
      session.destroy
      redirect_to root_path
  end
end
