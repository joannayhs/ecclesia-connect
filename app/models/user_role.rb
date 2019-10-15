class UserRole < ApplicationRecord
    belongs_to :user
    belongs_to :role
    belongs_to :assigner, class_name: "User", foreign_key: "assigner_id"

end
