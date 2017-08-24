# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
  Role.create(:name => :admin) if not Role.find_by_name(:admin)
  Role.create(:name => :user) if not Role.find_by_name(:user)

  # Users
user = User.new( first_name:  "ivan",
              last_name: "ivanov",              
              email: "iv1@ukr.net",
              birthdate: "01.08.2017",
              password: "admin123")
user.roles << Role.find_by_name(:admin)
user.save!



user = User.new( first_name:  "petya",
              last_name: "petrov",              
              email: "pe1@ukr.net",
              birthdate: "01.08.2017",
              password: "12345678")


user.roles << Role.find_by_name(:user)
user.save!
             
