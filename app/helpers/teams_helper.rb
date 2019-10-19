module TeamsHelper

    def team_form 
        if current_user.admin?  
            render 'teams/form'
        else 
            redirect_to user_path(current_user)
        end  
    end 
end
