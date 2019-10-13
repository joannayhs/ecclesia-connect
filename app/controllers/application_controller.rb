class ApplicationController < ActionController::Base
    helper_method :logged_in?
    helper_method :current_user
    helper_method :login


    private 
    def logged_in? 
        !!current_user
    end 

    def current_user 
        User.find_by(id: session[:user_id])
    end 

    def login(user)
        session[:user_id] = user.id
        redirect_to user_path(user.id)
    end 

    def authenticate 
        redirect_to login_path if !logged_in? 
    end 

end
