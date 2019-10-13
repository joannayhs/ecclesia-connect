class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?

    def current_user 
        User.find(session[:user_id])
    end 

    def logged_in? 
        !!session[:user_id]
    end 

    def login(user)
        session[:user_id] = user.id
        redirect_to user_path(user.id)
    end 

end
