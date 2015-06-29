# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150623094135) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string  "name"
    t.integer "zipcode"
    t.string  "country"
    t.text    "region"
    t.float   "lng"
    t.float   "lat"
    t.text    "countr_code"
    t.text    "province"
  end

  create_table "establishments", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "photo_path"
    t.integer  "owner_id"
    t.string   "adress"
    t.integer  "city_id"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
  end

  create_table "owners", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "username"
  end

  create_table "reviews", force: :cascade do |t|
    t.text    "text"
    t.integer "user_id"
    t.integer "establishment_id"
    t.integer "rate"
  end

  create_table "user_fellowships", id: false, force: :cascade do |t|
    t.integer "user_a_id"
    t.integer "user_b_id"
  end

  create_table "user_followings", force: :cascade do |t|
    t.integer "user_a_id"
    t.integer "user_b_id"
    t.date    "created_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "username"
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "visits", force: :cascade do |t|
    t.integer "establishment_id"
    t.integer "user_id"
  end

end
