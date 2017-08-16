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
              username: "i890",
              email: "iv1@ukr.net",
              birthdate: "01.08.2017",
              password: "admin123")
User.create!( first_name:  "petya",
              last_name: "petrov",
              username: "petr",
              email: "pe1@ukr.net",
              birthdate: "01.08.2017",
              password: "12345678")
             
