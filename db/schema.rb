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

ActiveRecord::Schema.define(version: 2021_05_20_222634) do

  create_table "care_users", force: :cascade do |t|
    t.string "image"
    t.string "department", null: false
    t.string "name", null: false
    t.integer "age"
    t.integer "gender"
    t.string "school"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "grade"
    t.integer "contract"
    t.string "use_day"
    t.string "house"
    t.string "disabled"
    t.string "eat"
    t.string "evacuation"
    t.string "cange_clothes"
    t.string "diapers"
    t.string "allergy"
    t.string "allergy_text"
    t.string "seizures"
    t.string "seizures_text"
    t.string "medicine"
    t.string "communicate_a"
    t.string "communicate_summary_a"
    t.string "communicate_b"
    t.string "communicate_summary_b"
    t.text "indoor"
    t.text "outdoor"
    t.text "summary"
    t.boolean "cuser_confirm", default: false, null: false
  end

  create_table "intermediates", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "care_user_id", null: false
    t.boolean "confirmation", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["care_user_id"], name: "index_intermediates_on_care_user_id"
    t.index ["user_id"], name: "index_intermediates_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest", null: false
    t.string "department", null: false
    t.string "remember_digest"
    t.boolean "admin"
  end

end
