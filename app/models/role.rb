class Role < ApplicationRecord
    has_many :user_roles
    has_many :users, through: :user_roles
    belongs_to :team
    validates :title, presence: true

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
