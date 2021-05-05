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

ActiveRecord::Schema.define(version: 2021_05_04_133027) do

  create_table "care_users", force: :cascade do |t|
    t.string "image"
    t.string "department"
    t.string "name"
    t.integer "age"
    t.integer "gender"
    t.string "school"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "contract"
    t.date "use_day"
    t.string "house"
    t.string "disabled"
    t.string "eat"
    t.string "evacuation"
    t.string "cange_clothes"
    t.boolean "diapers"
    t.boolean "pat"
    t.string "allergy"
    t.boolean "seizures"
    t.boolean "medicine"
    t.string "communicate_a"
    t.string "communicate_summary_a"
    t.string "communicate_b"
    t.string "communicate_summary_b"
    t.text "indoor"
    t.text "outdoor"
    t.text "summary"
    t.boolean "cuser_confirm"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "department"
    t.string "remember_digest"
    t.boolean "admin"
  end

end
