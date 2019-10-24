class SessionController < ApplicationController
  def new 
  end 
  
  def create
      user = User.find_by(email: params[:email])
      if user && user.authenticate(params[:password])
        login(user)
      elsif auth 
        user = User.from_oauth(auth) 
        login(user)
      else 
        redirect_to login_path 
        flash[:alert] = "Username or password is incorrect"
    end 
  end 

  def destroy
      session.destroy
      redirect_to login_path
  end

  private 

  def auth 
    request.env['omniauth.auth']
  end
end
