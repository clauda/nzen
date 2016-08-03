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

ActiveRecord::Schema.define(version: 20160803052607) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.string   "permalink"
    t.boolean  "published",      default: true
    t.boolean  "primary",        default: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "services_count"
    t.index ["name"], name: "index_categories_on_name", using: :btree
    t.index ["permalink"], name: "index_categories_on_permalink", using: :btree
  end

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.string   "state"
    t.boolean  "published",  default: false
    t.string   "permalink"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["name"], name: "index_cities_on_name", using: :btree
    t.index ["permalink"], name: "index_cities_on_permalink", using: :btree
  end

  create_table "districts", force: :cascade do |t|
    t.string   "name"
    t.string   "permalink"
    t.string   "lat"
    t.string   "lng"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "services_count"
    t.integer  "city_id"
    t.index ["city_id"], name: "index_districts_on_city_id", using: :btree
    t.index ["name"], name: "index_districts_on_name", unique: true, using: :btree
    t.index ["permalink"], name: "index_districts_on_permalink", unique: true, using: :btree
  end

  create_table "issues", force: :cascade do |t|
    t.integer  "service_id"
    t.string   "reason"
    t.text     "message"
    t.string   "status"
    t.string   "name"
    t.string   "email"
    t.string   "code"
    t.text     "observation"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["service_id"], name: "index_issues_on_service_id", using: :btree
  end

  create_table "reviews", force: :cascade do |t|
    t.string   "comment"
    t.integer  "rating"
    t.integer  "service_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "like"
    t.boolean  "unlike"
    t.index ["service_id"], name: "index_reviews_on_service_id", using: :btree
    t.index ["user_id"], name: "index_reviews_on_user_id", using: :btree
  end

  create_table "services", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "category_id"
    t.integer  "district_id"
    t.text     "description"
    t.string   "permalink"
    t.string   "phone"
    t.string   "web"
    t.string   "email"
    t.string   "logo"
    t.string   "address"
    t.string   "lat"
    t.string   "lng"
    t.string   "zipcode"
    t.string   "facebook"
    t.string   "instagram"
    t.boolean  "published",     default: true
    t.boolean  "premium",       default: false
    t.boolean  "verified",      default: false
    t.boolean  "deleted",       default: false
    t.boolean  "banned",        default: false
    t.string   "banned_reason"
    t.time     "opens"
    t.time     "closes"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "views",         default: 0
    t.index ["address"], name: "index_services_on_address", using: :btree
    t.index ["category_id"], name: "index_services_on_category_id", using: :btree
    t.index ["description"], name: "index_services_on_description", using: :btree
    t.index ["district_id"], name: "index_services_on_district_id", using: :btree
    t.index ["name"], name: "index_services_on_name", using: :btree
    t.index ["permalink"], name: "index_services_on_permalink", using: :btree
    t.index ["user_id"], name: "index_services_on_user_id", using: :btree
    t.index ["zipcode"], name: "index_services_on_zipcode", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",         null: false
    t.string   "encrypted_password",     default: "",         null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,          null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "name"
    t.string   "role",                   default: "customer"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "image"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "districts", "cities"
  add_foreign_key "reviews", "services"
  add_foreign_key "reviews", "users"
  add_foreign_key "services", "categories"
  add_foreign_key "services", "districts"
  add_foreign_key "services", "users"
end
