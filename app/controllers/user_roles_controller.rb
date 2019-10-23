class UserRolesController < ApplicationController
  def create
    @user_role = UserRole.create(user_role_params)
    if @user_role.save 
        role = Role.find(@user_role.role_id)
        role.remove_user
        role.save
        redirect_to role_path(@user_role.role_id)
    else 
        render 'roles/show'
        flash[:alert] = "There was an error"
    end 
  end

  def update 
    get_user_role  
      if @user_role && @user_role.user_id == current_user.id
        @user_role.confirmed = true 
      else 
        redirect_to profile_path
        flash[:alert] = "Role can only be confirmed by the user."
     end 
  end 

  def destroy
    get_user_role
    role = Role.find_by(id: @user_role.role_id)
    role.add_user
    role.save
    @user_role.destroy 
    redirect_to user_path(@user_role.user_id)
  end

  private 

  def user_role_params
    params.require(:user_roles).permit(:user_id, :role_id, :assigner_id)
  end 

  def get_user_role 
    @user_role = UserRole.find_by(user_id: params[:user_id], role_id: params[:format])
  end 

end
