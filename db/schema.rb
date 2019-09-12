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

ActiveRecord::Schema.define(version: 2019_09_11_071730) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "zip"
    t.string "pref"
    t.string "city"
    t.string "addr"
    t.bigint "teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["teacher_id"], name: "index_addresses_on_teacher_id"
  end

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "companies", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string "phonenumber"
    t.string "mailaddress1"
    t.string "mailaddress2"
    t.boolean "phonecall"
    t.bigint "teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["teacher_id"], name: "index_contacts_on_teacher_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "student_id"
    t.bigint "teacher_id"
    t.bigint "room_id"
    t.index ["room_id"], name: "index_messages_on_room_id"
    t.index ["student_id"], name: "index_messages_on_student_id"
    t.index ["teacher_id"], name: "index_messages_on_teacher_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.string "content"
    t.string "title"
    t.bigint "admin_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_id"], name: "index_notifications_on_admin_id"
  end

  create_table "personalinfos", force: :cascade do |t|
    t.string "national"
    t.integer "sex"
    t.date "birthday"
    t.bigint "teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["teacher_id"], name: "index_personalinfos_on_teacher_id"
  end

  create_table "prefectures", force: :cascade do |t|
    t.string "name"
    t.bigint "teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["teacher_id"], name: "index_prefectures_on_teacher_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.bigint "student_id"
    t.bigint "teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id", "teacher_id"], name: "index_relationships_on_student_id_and_teacher_id", unique: true
    t.index ["student_id"], name: "index_relationships_on_student_id"
    t.index ["teacher_id"], name: "index_relationships_on_teacher_id"
  end

  create_table "requests", force: :cascade do |t|
    t.bigint "student_id"
    t.bigint "teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id", "teacher_id"], name: "index_requests_on_student_id_and_teacher_id", unique: true
    t.index ["student_id"], name: "index_requests_on_student_id"
    t.index ["teacher_id"], name: "index_requests_on_teacher_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "station_lines", force: :cascade do |t|
    t.string "name"
    t.bigint "company_id"
    t.bigint "teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_station_lines_on_company_id"
    t.index ["teacher_id"], name: "index_station_lines_on_teacher_id"
  end

  create_table "stations", force: :cascade do |t|
    t.string "name"
    t.bigint "prefecture_id"
    t.bigint "station_line_id"
    t.bigint "teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["prefecture_id"], name: "index_stations_on_prefecture_id"
    t.index ["station_line_id"], name: "index_stations_on_station_line_id"
    t.index ["teacher_id"], name: "index_stations_on_teacher_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.boolean "billing"
    t.index ["email"], name: "index_students_on_email", unique: true
    t.index ["reset_password_token"], name: "index_students_on_reset_password_token", unique: true
  end

  create_table "teacher_stations", force: :cascade do |t|
    t.bigint "teacher_id"
    t.bigint "station_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["station_id"], name: "index_teacher_stations_on_station_id"
    t.index ["teacher_id", "station_id"], name: "index_teacher_stations_on_teacher_id_and_station_id", unique: true
    t.index ["teacher_id"], name: "index_teacher_stations_on_teacher_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["email"], name: "index_teachers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_teachers_on_reset_password_token", unique: true
  end

  add_foreign_key "addresses", "teachers"
  add_foreign_key "contacts", "teachers"
  add_foreign_key "messages", "rooms"
  add_foreign_key "messages", "students"
  add_foreign_key "messages", "teachers"
  add_foreign_key "notifications", "admins"
  add_foreign_key "personalinfos", "teachers"
  add_foreign_key "prefectures", "teachers"
  add_foreign_key "relationships", "students"
  add_foreign_key "relationships", "teachers"
  add_foreign_key "requests", "students"
  add_foreign_key "requests", "teachers"
  add_foreign_key "station_lines", "companies"
  add_foreign_key "station_lines", "teachers"
  add_foreign_key "stations", "prefectures"
  add_foreign_key "stations", "station_lines"
  add_foreign_key "stations", "teachers"
  add_foreign_key "teacher_stations", "stations"
  add_foreign_key "teacher_stations", "teachers"
end
