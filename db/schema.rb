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

ActiveRecord::Schema.define(version: 20151207144426) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bmis", force: :cascade do |t|
    t.integer  "user_id"
    t.decimal  "value",    precision: 4, scale: 2
    t.datetime "datetime"
  end

  create_table "comments", force: :cascade do |t|
    t.text    "content"
    t.integer "message_id"
    t.integer "user_id"
  end

  add_index "comments", ["message_id"], name: "index_comments_on_message_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "devices", force: :cascade do |t|
    t.integer "user_id"
    t.string  "timestamp_on"
    t.string  "timestamp_off"
  end

  create_table "messages", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  create_table "tokens", force: :cascade do |t|
    t.string   "access_token"
    t.datetime "expires_at"
    t.integer  "user_id"
    t.boolean  "active"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                           null: false
    t.string   "name",                            null: false
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "activation_state"
    t.string   "activation_token"
    t.datetime "activation_token_expires_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
  end

  add_index "users", ["activation_token"], name: "index_users_on_activation_token", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  add_foreign_key "comments", "messages"
end
