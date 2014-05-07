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

ActiveRecord::Schema.define(version: 20140507215521) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "applicants", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "birthdate"
    t.string   "address"
    t.integer  "age"
    t.string   "current_job_company"
    t.string   "current_job_role"
    t.string   "current_job_city"
    t.integer  "rating",                    default: 0
    t.string   "phone_number"
    t.string   "email_address"
    t.string   "resume_file_name"
    t.string   "resume_content_type"
    t.integer  "resume_file_size"
    t.datetime "resume_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "resume_parse"
    t.string   "cover_letter_file_name"
    t.string   "cover_letter_content_type"
    t.integer  "cover_letter_file_size"
    t.datetime "cover_letter_updated_at"
  end

  create_table "companies", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "job_applications", force: true do |t|
    t.integer  "job_id"
    t.integer  "applicant_id"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "application_status"
  end

  create_table "jobs", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.boolean  "filled",           default: false
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "department"
    t.string   "employment_type"
    t.string   "experience_level"
    t.integer  "job_code"
    t.string   "location"
    t.boolean  "live_status",      default: true
  end

  create_table "notes", force: true do |t|
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "applicant_id"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.boolean  "admin",                  default: false
    t.string   "stripe_customer_token"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
