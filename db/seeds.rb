# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
  Role.create(:name => :admin)
  Role.create(:name => :user)

  # Users
User.create!( first_name:  "ivan",
              last_name: "ivanov",
             email: "iv@ukr.net",
             encrypted_password: "admin123",
             password_confirmation: "admin123",
             role_id:  2 )