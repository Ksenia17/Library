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
              birthdate: "01.09.2000",
              password: "admin123")
user.roles << Role.find_by_name(:admin)
user.save!

user = User.new( first_name:  "anya",
              last_name: "petrova",              
              email: "an@ukr.net",
              birthdate: "24.03.2002",
              password: "an24032002")
user.roles << Role.find_by_name(:admin)
user.save!

user = User.new( first_name:  "petya",
              last_name: "petrov",              
              email: "pe1@ukr.net",
              birthdate: "01.10.2002",
              password: "12345678")


user.roles << Role.find_by_name(:user)
user.save!

user = User.new( first_name:  "mari",
              last_name: "mixeeva",              
              email: "mari@ukr.net",
              birthdate: "17.07.2017",
              password: "87654321")


user.roles << Role.find_by_name(:user)
user.save!


# это не проходит!

# Book_types
#book_type = Book_type.new( name:  "История" ) #1
#book_type.save!
#book_type = Book_type.new( name:  "Детектив" ) #2
#book_type.save!
#book_type = Book_type.new( name:  "Комедия" ) #3
#book_type.save!
#book_type = Book_type.new( name:  "Фантастика" ) #4
#book_type.save!
#book_type = Book_type.new( name:  "В мире животных" ) #5
#book_type.save!
#book_type = Book_type.new( name:  "Детская литература" ) #6
#book_type.save!
#book_type = Book_type.new( name:  "Фэнтези" ) #7
#book_type.save!
#book_type = Book_type.new( name:  "Приключения" ) #8
#book_type.save!

# books
#book = Book.new( name:  "Четвертая высота",book_type_id: "6",user_id: "1",year_book: "2006",author: "Елена Ильина")

#book.save!
#book = Book.new( name:  "Гарри Поттер и узник Азкабана",
#              book_type_id: "7",              
#              user_id: "1",
#              year_book: "2007",
#              author: "Роулинг Джоан Кэтлин")
#book.save!
#book = Book.new( name:  "Темная Башня",
#              book_type_id: "7",              
#              user_id: "1",
#              year_book: "2011",
#              author:  "Кинг Стивен")
#book.save!
#book = Book.new( name:  "Граф Монте-Кристо",
#              book_type_id: "8",              
#              user_id: "1",
#              year_book: "2009",
#              author:  "Кинг Стивен")
#book.save!

             




