class SessionController < ApplicationController
  def new 
    render 'welcome/home'
  end 
  
  def create
    if params[:user]
      if @user = User.find_by(email: params[:user][:email]) && @user.authenticate(params[:user][:password]) 
        session[:user_id] = @user.id 
        redirect_to user_path(@user)
      end
    elsif auth
        @user = User.find_or_create_by(uid: auth[:uid]) do |u|
          u.uid = auth[:uid]
          u.name = auth['info']['name']
          u.email = auth['info']['email']
          u.save
        end 
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

  private 
  def auth 
    request.env['omniauth.auth']
  end
end
