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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20160808144759) do
=======
ActiveRecord::Schema.define(version: 20160808094459) do

  create_table "authorizations", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
>>>>>>> 7dafc6d928f5e9a33c940c8b8162d0297a331ade

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.float    "avg_price"
    t.float    "avg_rating"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "picture"
  end

  add_index "items", ["user_id", "created_at"], name: "index_items_on_user_id_and_created_at"
  add_index "items", ["user_id"], name: "index_items_on_user_id"

  create_table "reviews", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "comment"
    t.float    "price"
    t.float    "rating"
    t.string   "store"
    t.integer  "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "update_at"
  end

  add_index "reviews", ["item_id"], name: "index_reviews_on_item_id"
  add_index "reviews", ["user_id", "created_at"], name: "index_reviews_on_user_id_and_created_at"
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",             default: false
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
