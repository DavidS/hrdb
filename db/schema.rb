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

ActiveRecord::Schema.define(version: 20140727135545) do

  create_table "people", force: true do |t|
    t.string   "login",                                null: false
    t.string   "email",                                null: false
    t.string   "crypted_password",                     null: false
    t.string   "salt",                                 null: false
    t.string   "first_name",                           null: false
    t.string   "middle_name"
    t.string   "last_name",                            null: false
    t.string   "ssn"
    t.date     "birthdate"
    t.string   "address_line_1"
    t.string   "address_line_2"
    t.string   "address_line_3"
    t.string   "telephone_mobile"
    t.string   "telephone_office"
    t.string   "telephone_private"
    t.string   "personnel_number"
    t.date     "first_work_day"
    t.float    "working_hours_total",                  null: false
    t.float    "working_hours_per_day",                null: false
    t.integer  "holidays",                             null: false
    t.integer  "holidays_left",                        null: false
    t.float    "hours",                  default: 0.0, null: false
    t.float    "overtime_hours",         default: 0.0, null: false
    t.text     "public_job_description"
    t.text     "private_notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "people", ["email"], name: "index_people_on_email", unique: true

  create_table "people_projects", id: false, force: true do |t|
    t.integer "person_id",  null: false
    t.integer "project_id", null: false
  end

  add_index "people_projects", ["person_id"], name: "index_people_projects_on_person_id"
  add_index "people_projects", ["project_id"], name: "index_people_projects_on_project_id"

  create_table "projects", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
