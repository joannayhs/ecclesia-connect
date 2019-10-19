class Role < ApplicationRecord
    has_many :user_roles
    has_many :users, through: :user_roles
    belongs_to :team
   
    accepts_nested_attributes_for :user_roles
    accepts_nested_attributes_for :team

    def authorize(user)
        self.users.include?(user)
    end

    def  self.by_team(team)
        where(team_id: team)
    end 

    def self.available
        where(confirmed: false)
    end  
    
    def self.unavailable
        where(confirmed: true)
    end 
end
