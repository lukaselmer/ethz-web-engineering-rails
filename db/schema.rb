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

ActiveRecord::Schema.define(version: 20140517014528) do

  create_table "activities", force: true do |t|
    t.string   "name",            default: "",    null: false
    t.string   "location",        default: "",    null: false
    t.datetime "start_at"
    t.integer  "duration",        default: 60,    null: false
    t.text     "description",     default: "",    null: false
    t.integer  "meetup_group_id",                 null: false
    t.boolean  "definite",        default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "votes_count",     default: 0,     null: false
    t.string   "image_url",       default: "",    null: false
    t.string   "image_link",      default: "",    null: false
  end

  add_index "activities", ["meetup_group_id"], name: "index_activities_on_meetup_group_id"

  create_table "meetup_groups", force: true do |t|
    t.integer  "owner_id",                 null: false
    t.string   "topic",       default: "", null: false
    t.date     "incepted_at",              null: false
    t.string   "home_town",   default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "meetup_groups", ["owner_id"], name: "index_meetup_groups_on_owner_id"

  create_table "memberships", force: true do |t|
    t.integer  "meetup_group_id", null: false
    t.integer  "user_id",         null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "memberships", ["meetup_group_id"], name: "index_memberships_on_meetup_group_id"
  add_index "memberships", ["user_id"], name: "index_memberships_on_user_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name",                   default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "votes", force: true do |t|
    t.integer  "activity_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "votes", ["activity_id"], name: "index_votes_on_activity_id"
  add_index "votes", ["user_id"], name: "index_votes_on_user_id"

end
