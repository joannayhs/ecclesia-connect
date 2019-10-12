class User < ApplicationRecord
    has_many :user_roles
    has_many :roles, through: :user_roles
    has_secure_password 

    EMAIL_REGEX = /[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}/i
    validates :name, presence: true 
    validates :email, presence:true, uniqueness: true, format: EMAIL_REGEX
    validates :password, length: {in: 6..20}

  
  
end
