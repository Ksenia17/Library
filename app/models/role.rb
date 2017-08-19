class Role < ApplicationRecord
  has_many :users_roles
  has_many :users, :through => :users_roles
  
#  attr_accesible :user
  validates :name , presence: true

end
