class Team < ApplicationRecord
    has_many :roles
    accepts_nested_attributes_for :roles
end
