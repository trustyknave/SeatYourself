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

ActiveRecord::Schema.define(version: 20150706212538) do

  create_table "cuisines", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
  end

  create_table "reservations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "restaurant_id"
    t.integer  "party_size"
    t.datetime "time"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "reservations", ["restaurant_id"], name: "index_reservations_on_restaurant_id"
  add_index "reservations", ["user_id"], name: "index_reservations_on_user_id"

  create_table "restaurants", force: :cascade do |t|
    t.string   "name"
    t.integer  "capacity"
    t.string   "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "owner_id"
    t.string   "timezone"
  end

  create_table "restaurants_cuisines", id: false, force: :cascade do |t|
    t.integer "restaurant_id"
    t.integer "cuisine_id"
  end

  add_index "restaurants_cuisines", ["cuisine_id"], name: "index_restaurants_cuisines_on_cuisine_id"
  add_index "restaurants_cuisines", ["restaurant_id"], name: "index_restaurants_cuisines_on_restaurant_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
