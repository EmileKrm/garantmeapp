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

ActiveRecord::Schema.define(version: 20170321102518) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "interviews", force: :cascade do |t|
    t.string   "professional_status"
    t.string   "city"
    t.date     "move_in_date"
    t.integer  "monthly_budget"
    t.integer  "monthly_income"
    t.boolean  "unique_signator"
    t.integer  "user_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "organisation_id"
    t.boolean  "has_found_apartment"
    t.string   "arrondissement"
    t.boolean  "has_a_cosigner"
    t.index ["organisation_id"], name: "index_interviews_on_organisation_id", using: :btree
    t.index ["user_id"], name: "index_interviews_on_user_id", using: :btree
  end

  create_table "organisations", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.date     "date_of_birth"
    t.string   "home_address"
    t.integer  "organisation_id"
    t.boolean  "is_manager"
    t.string   "provider"
    t.string   "uid"
    t.string   "linkedin_picture_url"
    t.string   "token"
    t.datetime "token_expiry"
    t.string   "photo"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["organisation_id"], name: "index_users_on_organisation_id", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "interviews", "organisations"
  add_foreign_key "interviews", "users"
  add_foreign_key "users", "organisations"
end
