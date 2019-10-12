class TeamsController < ApplicationController
    
    def index 
    end 

    def new 
        @team = Team.new
        @team.roles.build
    end 

    def create
        @team = Team.create(team_params)
        raise params.inspect
    end 

    private 

    def team_params
        params.require(:team).permit(:name, :description, :roles_attributes[:title, :description, :arrival_time] )
    end 
end


