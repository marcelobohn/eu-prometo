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

ActiveRecord::Schema.define(version: 20170607142232) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.string "abbrev"
    t.string "ibge"
    t.bigint "state_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["state_id"], name: "index_cities_on_state_id"
  end

  create_table "comments", force: :cascade do |t|
    t.string "description"
    t.bigint "user_id"
    t.bigint "promise_id"
    t.integer "type_comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["promise_id"], name: "index_comments_on_promise_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.integer "type_contact"
    t.text "description"
    t.bigint "user_id"
    t.datetime "readed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_contacts_on_user_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "elections", force: :cascade do |t|
    t.integer "year"
    t.integer "type_election"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "promise_id"
    t.date "remove"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["promise_id"], name: "index_favorites_on_promise_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "follows", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "manager_id"
    t.date "unfollow"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["manager_id"], name: "index_follows_on_manager_id"
    t.index ["user_id"], name: "index_follows_on_user_id"
  end

  create_table "managers", force: :cascade do |t|
    t.string "name"
    t.bigint "election_id"
    t.integer "country_id"
    t.integer "state_id"
    t.integer "city_id"
    t.integer "type_manager"
    t.date "start"
    t.date "end"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["election_id"], name: "index_managers_on_election_id"
    t.index ["user_id"], name: "index_managers_on_user_id"
  end

  create_table "promises", force: :cascade do |t|
    t.bigint "manager_id"
    t.text "description"
    t.date "date_finish"
    t.text "description_finish"
    t.bigint "user_id"
    t.integer "user_finish"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "video_link"
    t.string "image_link"
    t.date "authorized"
    t.string "news_link"
    t.integer "type_promise"
    t.index ["manager_id"], name: "index_promises_on_manager_id"
    t.index ["user_id"], name: "index_promises_on_user_id"
  end

  create_table "states", force: :cascade do |t|
    t.string "name"
    t.string "abbrev"
    t.string "ibge"
    t.bigint "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_states_on_country_id"
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
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.string "name"
    t.string "image"
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "cities", "states"
  add_foreign_key "comments", "promises"
  add_foreign_key "comments", "users"
  add_foreign_key "contacts", "users"
  add_foreign_key "favorites", "promises"
  add_foreign_key "favorites", "users"
  add_foreign_key "follows", "managers"
  add_foreign_key "follows", "users"
  add_foreign_key "managers", "elections"
  add_foreign_key "managers", "users"
  add_foreign_key "promises", "managers"
  add_foreign_key "promises", "users"
  add_foreign_key "states", "countries"
end
