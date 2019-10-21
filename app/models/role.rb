class Role < ApplicationRecord
    has_many :user_roles
    has_many :users, through: :user_roles
    belongs_to :team
    validates :title, presence: true

    def self.by_team(team)
        where(team_id: team)
    end 

    def self.available
        where("min_users >= ?" , 0)
    end  
    
    def self.unavailable
        where(min_users: 0)
    end 

    def change_availability 
        self.min_users -= 1 
    end 

end
