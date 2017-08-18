class UsersRole < ApplicationRecord
  belongs_to :user
  belongs_to :role

  attr_accesible :user, :user_id
  attr_accesible :role, :role_id
end
