module RolesHelper

    def assign_role 
        if current_user.admin? 
            render 'roles/assign_role'
        end 
    end 

end
