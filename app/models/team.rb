class Team < ApplicationRecord
    has_many :roles, dependent: :destroy
    has_many :users, through: :roles
    accepts_nested_attributes_for :roles
    validates :name, uniqueness: true

   
end
