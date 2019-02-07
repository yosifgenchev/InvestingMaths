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

ActiveRecord::Schema.define(version: 2019_02_06_222933) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dgrs", force: :cascade do |t|
    t.integer "dgr_1"
    t.integer "dgr_3"
    t.integer "dgr_5"
    t.integer "dgr_10"
    t.integer "mr_inc"
    t.bigint "stock_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["stock_id"], name: "index_dgrs_on_stock_id"
  end

  create_table "dividends", force: :cascade do |t|
    t.decimal "amount"
    t.bigint "stock_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["stock_id"], name: "index_dividends_on_stock_id"
  end

  create_table "earnings", force: :cascade do |t|
    t.decimal "actualEPS"
    t.bigint "stock_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["stock_id"], name: "index_earnings_on_stock_id"
  end

  create_table "stats", force: :cascade do |t|
    t.decimal "dividend_yield"
    t.decimal "current_price"
    t.integer "drip_years_count"
    t.bigint "stock_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["stock_id"], name: "index_stats_on_stock_id"
  end

  create_table "stocks", force: :cascade do |t|
    t.string "symbol"
    t.string "company_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "sector"
    t.string "industry"
    t.decimal "dividends_amount"
    t.decimal "earnings_amount"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "dgrs", "stocks"
  add_foreign_key "dividends", "stocks"
  add_foreign_key "earnings", "stocks"
  add_foreign_key "stats", "stocks"
end
