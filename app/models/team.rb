class Team < ApplicationRecord
    has_many :roles 
    has_many :users, through: :roles
    accepts_nested_attributes_for :roles
    validates :name, uniqueness: true

    def authorize(user)
        self.users.include?(current_user)
    end 
end
