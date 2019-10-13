class RolesController < ApplicationController

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
    @role = Role.find_by(id: params[:id])
end 

def edit
end 

def update
end 

def destroy
    @role = Role.find_by(id: params[:id])
    @role.destroy
    redirect_to roles_path
end 

private 
def role_params 
    params.require(:role).permit(:title, :description, :arrival_time, :date)
end 

end
