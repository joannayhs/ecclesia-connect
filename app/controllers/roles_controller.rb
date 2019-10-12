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

def edit
end 

def update
end 

def destroy
end 

private 
def role_params 
    params.require(:role).permit(:title, :description, :arrival_time, :date, :team_id)
end 

end
