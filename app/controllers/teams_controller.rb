class TeamsController < ApplicationController
      before_action :authenticate
    def index  
        @teams = Team.all
    end 

    def new 
        @team = Team.new 
        @team.roles.build
    end 

    def create 
        @team = Team.create(team_params) 
        redirect_to team_path(@team)
    end 

    def show
        get_team
    end 

    def edit 
        get_team
    end 

    def update
        get_team
    end 
     
    def  destroy
        get_team
    end 

    private 
    
    def team_params 
        params.require(:team).permit(:name, :description, role_ids:[], roles_attributes: [:title, :description, :arrival_time])
    end 

    def get_team 
        @team = Team.find(params[:id])
    end 

end

