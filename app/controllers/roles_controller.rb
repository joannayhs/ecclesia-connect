class RolesController < ApplicationController
  before_action :authenticate 
def index 
    @teams = Team.all
    if !params[:team].blank?
        @roles = Role.by_team(params["Team"])
    elsif !params[:availability].blank?
        if params[:availability] == "Filled Roles"
            @roles = Role.unavailable
        else
            @roles = Role.available
        end
    else
        raise params.inspect
        @roles = Role.all
    end 
end 

def new 
    @role = Role.new
end 

def create
    @role = Role.create(role_params)
    redirect_to role_path(@role)
end 

def show 
    get_role
end 

def edit
    get_role
end 

def update
    get_role
    @role.update(role_params)
    redirect_to role_path(@role)
end 

def destroy
    get_role
    @role.destroy if @role.authorize(current_user)
    redirect_to roles_path
end 

private 
def role_params 
    params.require(:role).permit(:title, :description, :arrival_time, :team_id, :confirmed, :min_users, user_roles:[:user_id, :assigner_id])
end 

def get_role
    @role = Role.find_by(id: params[:id])
end

end
