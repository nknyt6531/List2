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

ActiveRecord::Schema.define(version: 2022_03_14_122419) do

  create_table "comments", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "customer_id", null: false
    t.text "comment"
    t.integer "method", null: false
    t.integer "target", null: false
    t.integer "status", null: false
    t.date "next_date"
    t.time "next_time"
    t.string "sender"
    t.integer "rank"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_comments_on_customer_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "cunstomers", force: :cascade do |t|
    t.string "last_name", null: false
    t.string "first_name", null: false
    t.string "last_name_kana", null: false
    t.string "first_name_kana", null: false
    t.integer "gender_id", null: false
    t.date "birthday", null: false
    t.integer "age", null: false
    t.string "post_code", null: false
    t.string "home_phone_number"
    t.string "phone_number"
    t.string "address", null: false
    t.integer "list_group", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string "last_name", null: false
    t.string "first_name", null: false
    t.string "last_name_kana", null: false
    t.string "first_name_kana", null: false
    t.integer "gender_id", null: false
    t.date "birthday", null: false
    t.integer "age", null: false
    t.string "post_code", null: false
    t.string "home_phone_number"
    t.string "phone_number"
    t.string "address", null: false
    t.integer "list_group", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shifts", force: :cascade do |t|
    t.integer "user_id", null: false
    t.date "date", null: false
    t.time "start", null: false
    t.time "finish", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_shifts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
