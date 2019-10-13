class Team < ApplicationRecord
    has_many :roles 
    has_many :users, through: :roles
    accepts_nested_attributes_for :roles
end
