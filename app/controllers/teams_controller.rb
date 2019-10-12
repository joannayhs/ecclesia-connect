class TeamsController < ApplicationController

    def index 
    end 

    def new 
        @team = Team.new
    end 

    def create
        @team = Team.create(team_params)
    end 

    private 

    def team_params
        params.require(:team).permit(:name, :description, :roles=[])
    end 
end


