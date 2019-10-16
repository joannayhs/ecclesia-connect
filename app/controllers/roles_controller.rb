class RolesController < ApplicationController
  before_action :authenticate 
def index 
    @roles = Role.all
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
end 

def destroy
    get_role
    @role.destroy
    redirect_to roles_path
end 

private 
def role_params 
    params.require(:role).permit(:title, :description, :arrival_time, :team_id, :team)
end 

def get_role
    @role = Role.find_by(id: params[:id])
end
end
