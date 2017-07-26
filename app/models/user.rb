class User < ApplicationRecord
	validates :login, presence:true, length: { maximum: 10 }
	validates :password ,  presence: true, length: { maximum: 8 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
    validates :birthdate  ,  presence: true 
    validates :first_name ,  presence: true
    validates :last_name  ,  presence: true
    validates :role_id    ,  presence: true 
    validates :level      ,  presence: true              

end
