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

ActiveRecord::Schema.define(version: 20150706155352) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.integer  "client_id"
    t.float    "balance"
    t.string   "account_id"
    t.string   "pin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "accounts", ["client_id"], name: "index_accounts_on_client_id", using: :btree

  create_table "clients", force: :cascade do |t|
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

  add_index "clients", ["reset_password_token"], name: "index_clients_on_reset_password_token", unique: true, using: :btree

  create_table "messages", force: :cascade do |t|
    t.integer  "client_id"
    t.integer  "kind"
    t.boolean  "confirm"
    t.string   "account_id"
    t.float    "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "messages", ["client_id"], name: "index_messages_on_client_id", using: :btree

  create_table "profiles", force: :cascade do |t|
    t.integer  "client_id"
    t.string   "type"
    t.string   "businessname"
    t.integer  "category"
    t.string   "firstname"
    t.string   "lastname"
    t.integer  "age"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "profiles", ["client_id"], name: "index_profiles_on_client_id", using: :btree

  create_table "transactions", force: :cascade do |t|
    t.integer  "customer_id"
    t.integer  "vendor_id"
    t.float    "amount"
    t.integer  "state"
    t.integer  "kind"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_foreign_key "accounts", "clients"
  add_foreign_key "messages", "clients"
  add_foreign_key "profiles", "clients"
end
