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

ActiveRecord::Schema[7.0].define(version: 2023_02_01_181049) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "exchange_rate_providers", force: :cascade do |t|
    t.string "name"
    t.string "type"
    t.string "source_currency"
    t.string "source_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exchange_rates", force: :cascade do |t|
    t.string "currency", null: false
    t.integer "amount", null: false
    t.float "value", null: false
    t.date "published_at", null: false
    t.bigint "exchange_rate_provider_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exchange_rate_provider_id"], name: "index_exchange_rates_on_exchange_rate_provider_id"
  end

  add_foreign_key "exchange_rates", "exchange_rate_providers"
end
