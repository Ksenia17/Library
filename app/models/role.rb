class Role < ApplicationRecord
  has_many :users_roles
  has_many :users, :through => :users_roles
  
#  attr_accesible :user
  validates :name , presence: true

  def self.user_role
    Role.find_by_name(:user)
  end

  def self.adm_role
    Role.find_by_name(:admin)    
  end


end
