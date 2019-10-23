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
        @team = Team.new(team_params) 
        if @team.save 
            redirect_to team_path(@team)
        else 
            render :new 
        end 
    end 

    def show
        get_team
    end 

    def edit 
        get_team
    end 

    def update
        get_team
        if @team.update(team_params)
            redirect_to team_path(@team)
        else 
            render :edit 
        end 
    end 
     
    def destroy
        get_team
        @team.destroy
        redirect_to teams_path
    end 

    private 
    
    def team_params 
        params.require(:team).permit(:name, :description, role_ids:[], roles_attributes: [:title, :description, :arrival_time, :min_users])
    end 

    def get_team 
        @team = Team.find(params[:id])
    end 

end

