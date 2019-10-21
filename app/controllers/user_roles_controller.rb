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
    user_role = UserRole.find_by(user_id: params[:user_id], role_id: params[:format])
    role = Role.find_by(id: user_role.role_id).add_user
    user_role.destroy 
    redirect_to profile_path
  end

  private 

  def user_role_params
    params.require(:user_roles).permit(:user_id, :role_id, :assigner_id)
  end 

end
