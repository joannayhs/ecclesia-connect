class RolesController < ApplicationController
  before_action :authenticate 
def index 
    @teams = Team.all
    if !params["Team"].blank?
        @roles = Role.by_team(params["Team"])
    elsif !params["Availability"].blank?
        if params["Availability"] == "Filled Roles"
            @roles = Role.unavailable
        else
            @roles = Role.available
        end
    else
        @roles = Role.all
    end 
end 

def new 
    if params[:team_id]
        @role = Role.new(team_id: params[:team_id])
    else 
        @role = Role.new 
    end 

end 

def create
    @role = Role.create(role_params)
    redirect_to role_path(@role)
end 

def show 
    get_role
    @user = User.new
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
    @role.destroy
    redirect_to roles_path
end 

private 
def role_params 
    params.require(:role).permit(:title, :description, :arrival_time, :team_id, :confirmed, :min_users)
end 

def get_role
    @role = Role.find_by(id: params[:id])
end

end
