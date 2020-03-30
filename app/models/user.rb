class User < ActiveRecord:Base
    has_many :hikes

    has_secure_password

end