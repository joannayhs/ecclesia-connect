class SessionController < ApplicationController
  def new 
  end 
  
  def create
    @user = User.find_by(id: params[:id])
    return head(:forbidden) unless @user.authenticate(params[:password])
    session[:user_id] = @user.id
  end

  def destory
  end
end
