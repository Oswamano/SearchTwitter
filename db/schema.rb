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

ActiveRecord::Schema.define(version: 20160503021633) do

  create_table "orders", force: :cascade do |t|
    t.date     "date_recieved"
    t.text     "sale"
    t.integer  "posting_agent_id"
    t.integer  "sales_agent_id"
    t.integer  "trustee_sale_file_number"
    t.boolean  "high_liability"
    t.integer  "apn_number"
    t.text     "address"
    t.text     "state"
    t.text     "city"
    t.text     "county"
    t.integer  "zip_code"
    t.date     "post_by_date"
    t.boolean  "notice_sent"
    t.boolean  "confirmation_recieved"
    t.boolean  "proof_recieved"
    t.text     "publishing_instructions"
    t.date     "publishing_date_one"
    t.date     "publishing_date_two"
    t.date     "publishing_date_three"
    t.date     "publishing_date_four"
    t.date     "sale_date"
    t.text     "custom_sale_location"
    t.text     "trustor"
    t.decimal  "opening_bid_in_cents"
    t.decimal  "sold_amount_in_cents"
    t.text     "sale_information_notes"
    t.text     "notice_of_sale_amount"
    t.integer  "shipment_track_number"
    t.text     "shipped_to"
    t.text     "back_office_note"
    t.text     "posting_note"
    t.text     "sale_note"
    t.boolean  "posting_order_confirmed"
    t.boolean  "agent_paid"
    t.boolean  "order_active"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "file1"
    t.string   "file2"
    t.string   "file3"
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], name: "index_roles_on_name"

  create_table "settings", force: :cascade do |t|
    t.string   "setting_category"
    t.string   "setting_key"
    t.string   "setting_value"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"

end
