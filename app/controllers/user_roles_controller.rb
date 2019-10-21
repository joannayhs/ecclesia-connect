class UserRolesController < ApplicationController
  def create
    @user_role = UserRole.create(user_role_params)
    if @user_role.save 
        role = @user_role.role 
        role.change_availability
        redirect_to role_path(role)
    else 
        render 'roles/show'
    end 
  end

  def destroy
    
  end

  private 

  def user_role_params
    params.require(:user_roles).permit(:user_id, :role_id, :assigner_id)
  end 

end
