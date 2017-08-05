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

ActiveRecord::Schema.define(version: 20170805205117) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "book_histories", force: :cascade do |t|
    t.integer "request_id"
    t.integer "book_item_id"
    t.integer "user_id"
    t.datetime "owned_from"
    t.datetime "owned_to"
  end

  create_table "book_items", force: :cascade do |t|
    t.integer "book_id"
    t.integer "user_id"
    t.datetime "archived_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "book_requests", force: :cascade do |t|
    t.integer "user_id"
    t.integer "book_id"
    t.datetime "complete_time"
    t.boolean "approved_flg"
    t.integer "admin_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "book_types", force: :cascade do |t|
    t.string "name"
  end

  create_table "books", force: :cascade do |t|
    t.string "name"
    t.integer "book_type_id"
    t.integer "user_id"
    t.date "year_book"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.oid "picture"
  end

  create_table "fines", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "end_time"
    t.integer "book_history_id"
    t.integer "admin_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "login"
    t.date "birthdate"
    t.string "first_name"
    t.string "last_name"
    t.datetime "confirmation_time", null: false
    t.integer "role_id"
    t.integer "confirmation_by_admin_id"
    t.integer "level"
    t.datetime "end_time", null: false
    t.datetime "penalty_time", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
