class Role < ApplicationRecord
    has_many :user_roles
    has_many :users, through: :user_roles
    belongs_to :team
    validates :title, presence: true

    # def self.by_team(team)
    #     where(team_id: team)
    # end 

    scope :by_team, ->(team) {where(team_id: team)}

    def available?
        self.users.count <= self.min_users
    end  

    def self.available 
        where("min_users > ?", 0)
    end 

    def self.unavailable 
        where(min_users: 0)
    end

    def remove_user 
        self.min_users -= 1 
    end 

    def add_user
        self.min_users += 1
    end 

    def confirmed? 
        self.confirmed 
    end 
end
