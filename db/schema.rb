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

ActiveRecord::Schema.define(version: 20170323142127) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree
  end

  create_table "attachinary_files", force: :cascade do |t|
    t.string   "attachinariable_type"
    t.integer  "attachinariable_id"
    t.string   "scope"
    t.string   "public_id"
    t.string   "version"
    t.integer  "width"
    t.integer  "height"
    t.string   "format"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["attachinariable_type", "attachinariable_id", "scope"], name: "by_scoped_parent", using: :btree
  end

  create_table "interviews", force: :cascade do |t|
    t.string   "professional_status"
    t.string   "city"
    t.date     "move_in_date"
    t.integer  "monthly_budget"
    t.integer  "monthly_income"
    t.boolean  "unique_signator"
    t.integer  "user_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "organisation_id"
    t.boolean  "has_found_apartment"
    t.string   "arrondissement"
    t.boolean  "has_a_cosigner"
    t.string   "address"
    t.boolean  "status",              default: false
    t.string   "landlord_email"
    t.string   "monthly_rent"
    t.boolean  "interview_completed", default: false
    t.boolean  "documents_submitted", default: false
    t.boolean  "documents_validated", default: false
    t.boolean  "agreement_signed",    default: false
    t.boolean  "lease_provided",      default: false
    t.boolean  "lease_signed",        default: false
    t.index ["organisation_id"], name: "index_interviews_on_organisation_id", using: :btree
    t.index ["user_id"], name: "index_interviews_on_user_id", using: :btree
  end

  create_table "messages", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "content"
    t.integer  "sender_id"
    t.integer  "receiver_id"
  end

  create_table "organisations", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
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
    t.string   "linkedin_first_name"
    t.string   "linkedin_last_name"
    t.boolean  "admin",                  default: false, null: false
    t.string   "current_status"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["organisation_id"], name: "index_users_on_organisation_id", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "interviews", "organisations"
  add_foreign_key "interviews", "users"
  add_foreign_key "users", "organisations"
end
