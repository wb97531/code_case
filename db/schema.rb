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

ActiveRecord::Schema.define(version: 20150326202046) do

  create_table "coders", force: true do |t|
    t.string   "coder_name"
    t.string   "password_digest"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "phone"
    t.boolean  "text_verified",   default: false
  end

  create_table "courses", force: true do |t|
    t.string   "title"
    t.string   "place"
    t.string   "instructor"
    t.text     "description"
    t.date     "start_date"
    t.date     "completion_date"
    t.boolean  "certificate"
    t.boolean  "completed"
    t.integer  "coder_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", force: true do |t|
    t.string   "project_name"
    t.string   "github_link"
    t.date     "deadline"
    t.text     "description"
    t.integer  "priority"
    t.integer  "coder_id"
    t.boolean  "current",              default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "browser_project_link"
  end

  create_table "snippets", force: true do |t|
    t.string   "objective"
    t.string   "image_name"
    t.string   "github_file_link"
    t.integer  "project_id"
    t.integer  "coder_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
