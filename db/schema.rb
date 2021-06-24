# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_06_24_041912) do

  create_table "grapes", charset: "utf8", force: :cascade do |t|
    t.string "grape_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "howtos", charset: "utf8", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "shops", charset: "utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_shops_on_email", unique: true
  end

  create_table "wholesalers", charset: "utf8", force: :cascade do |t|
    t.string "company_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "winaries", charset: "utf8", force: :cascade do |t|
    t.string "winary_name"
    t.string "winary_name_kana"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "wines", charset: "utf8", force: :cascade do |t|
    t.string "wine_name", null: false
    t.string "wine_name_kana"
    t.integer "vintage"
    t.string "wine_type", null: false
    t.text "comment"
    t.text "memo"
    t.integer "country_id"
    t.string "state"
    t.integer "purchase_price"
    t.integer "selling_price"
    t.integer "stock", null: false
    t.bigint "shop_id", null: false
    t.bigint "winary_id"
    t.bigint "wholesaler_id"
    t.bigint "grape_id"
    t.boolean "onlist", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["grape_id"], name: "index_wines_on_grape_id"
    t.index ["shop_id"], name: "index_wines_on_shop_id"
    t.index ["wholesaler_id"], name: "index_wines_on_wholesaler_id"
    t.index ["winary_id"], name: "index_wines_on_winary_id"
  end

  add_foreign_key "wines", "grapes"
  add_foreign_key "wines", "shops"
  add_foreign_key "wines", "wholesalers"
  add_foreign_key "wines", "winaries"
end
