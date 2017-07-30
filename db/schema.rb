# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170730073418) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: :cascade do |t|
    t.string "name"
    t.integer "book_type_id"
    t.integer "user_id"
    t.date "year_book"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.oid "picture"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "login"
    t.string "password"
    t.string "email"
    t.date "birthdate"
    t.string "first_name"
    t.string "last_name"
    t.datetime "confirmation_time"
    t.integer "role_id"
    t.integer "confirmation_by_admin_id"
    t.integer "level"
    t.datetime "end_time"
    t.datetime "penalty_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
