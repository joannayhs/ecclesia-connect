module RolesHelper

    def assign_role 
        if current_user.admin? 
            render 'roles/assign_role'
        end 
    end 

    def role_form
        if current_user.admin? || current_user.roles.include?(self)
            render 'roles/role_form'
        end
    end 

  

end
