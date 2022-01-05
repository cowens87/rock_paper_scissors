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

ActiveRecord::Schema.define(version: 2020_12_18_203924) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boba_tea_requests", force: :cascade do |t|
    t.bigint "boba_tea_id"
    t.bigint "request_id"
    t.index ["boba_tea_id"], name: "index_boba_tea_requests_on_boba_tea_id"
    t.index ["request_id"], name: "index_boba_tea_requests_on_request_id"
  end

  create_table "boba_teas", force: :cascade do |t|
    t.string "image"
    t.string "name"
    t.float "price"
    t.string "base"
    t.boolean "caffeinated"
    t.string "description"
    t.bigint "teahouse_id"
    t.index ["teahouse_id"], name: "index_boba_teas_on_teahouse_id"
  end

  create_table "requests", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "city"
    t.string "state"
    t.integer "zip"
    t.string "reason"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teahouses", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "city"
    t.string "state"
    t.integer "zip"
  end

  add_foreign_key "boba_tea_requests", "boba_teas"
  add_foreign_key "boba_tea_requests", "requests"
  add_foreign_key "boba_teas", "teahouses"
end
