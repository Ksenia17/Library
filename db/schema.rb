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

ActiveRecord::Schema.define(version: 20200304213457) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "book_histories", force: :cascade do |t|
    t.integer "request_id"
    t.bigint "book_item_id"
    t.bigint "user_id"
    t.datetime "owned_from"
    t.datetime "owned_to"
    t.bigint "book_request_id"
    t.index ["book_item_id"], name: "index_book_histories_on_book_item_id"
    t.index ["book_request_id"], name: "index_book_histories_on_book_request_id"
    t.index ["user_id"], name: "index_book_histories_on_user_id"
  end

  create_table "book_items", force: :cascade do |t|
    t.bigint "book_id"
    t.bigint "user_id"
    t.datetime "archived_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_book_items_on_book_id"
    t.index ["user_id"], name: "index_book_items_on_user_id"
  end

  create_table "book_requests", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "book_id"
    t.datetime "complete_time"
    t.boolean "approved_flg"
    t.integer "admin_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_book_requests_on_book_id"
    t.index ["user_id"], name: "index_book_requests_on_user_id"
  end

  create_table "book_types", force: :cascade do |t|
    t.string "name"
  end

  create_table "books", force: :cascade do |t|
    t.string "name"
    t.oid "picture"
    t.bigint "book_type_id"
    t.bigint "user_id"
    t.date "year_book"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "author"
    t.string "image"
    t.index ["book_type_id"], name: "index_books_on_book_type_id"
    t.index ["user_id"], name: "index_books_on_user_id"
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer "priority", default: 0, null: false
    t.integer "attempts", default: 0, null: false
    t.text "handler", null: false
    t.text "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string "locked_by"
    t.string "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "fines", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "end_time"
    t.bigint "book_history_id"
    t.integer "admin_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_history_id"], name: "index_fines_on_book_history_id"
    t.index ["user_id"], name: "index_fines_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
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
    t.date "birthdate", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.datetime "confirmation_time"
    t.integer "confirmation_by_admin_id"
    t.integer "level"
    t.datetime "end_time"
    t.datetime "penalty_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_roles", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  add_foreign_key "users_roles", "roles"
  add_foreign_key "users_roles", "users"
end
