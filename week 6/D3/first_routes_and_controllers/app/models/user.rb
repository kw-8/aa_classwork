class User < ApplicationRecord

    def initialize(name, email)
        @name = name
        @email = email
    end

    validates :name, :email, presence: true 

end
