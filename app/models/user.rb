class User < ApplicationRecord
	validates :login, presence: true, length: { maximum: 15 }  
	validates :password, presence: true, length: { maximum: 8 }
	validates :email, presence: true
	validates :birthdate, presence: true
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :role_id, presence: true
	validates :level, presence: true
end
