module RolesHelper

    def assign_role 
        if current_user.admin? 
            render 'roles/assign_role'
        end 
    end 

    def confirm 
        if current_user.id == params[:id]
            if @role.confirmed?
                "Yes" 
            else 
                render 'roles/confirm_role'
            end
        end
    end 
end
