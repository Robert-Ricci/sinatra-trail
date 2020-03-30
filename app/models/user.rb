class User < ActiveRecord::Base
    has_many :hikes

    validates :username, presence: true , uniqueness: true
    validates :email, presence: true , uniqueness: true
    validates :password, presence: true 
    
    has_secure_password

end