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

ActiveRecord::Schema.define(version: 20150705162715) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.integer  "accountable_id"
    t.string   "accountable_type"
    t.float    "balance"
    t.string   "account_id"
    t.integer  "pin"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "accounts", ["accountable_type", "accountable_id"], name: "index_accounts_on_accountable_type_and_accountable_id", using: :btree

  create_table "messages", force: :cascade do |t|
    t.integer  "messagable_id"
    t.string   "messagable_type"
    t.string   "body"
    t.string   "type"
    t.boolean  "closed"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "messages", ["messagable_type", "messagable_id"], name: "index_messages_on_messagable_type_and_messagable_id", using: :btree

  create_table "transactions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "vendor_id"
    t.float    "amount"
    t.string   "state"
    t.string   "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "transactions", ["user_id"], name: "index_transactions_on_user_id", using: :btree
  add_index "transactions", ["vendor_id"], name: "index_transactions_on_vendor_id", using: :btree

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
    t.string   "number"
    t.string   "firstname"
    t.string   "lastname"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["number"], name: "index_users_on_number", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "vendors", force: :cascade do |t|
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
    t.string   "number"
  end

  add_index "vendors", ["email"], name: "index_vendors_on_email", unique: true, using: :btree
  add_index "vendors", ["reset_password_token"], name: "index_vendors_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "transactions", "users"
  add_foreign_key "transactions", "vendors"
end
