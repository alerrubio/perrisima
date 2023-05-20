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

ActiveRecord::Schema[7.0].define(version: 2023_05_20_010818) do
  create_table "categories", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", limit: 100, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", limit: 100, null: false
    t.string "phone_number", limit: 10, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["phone_number"], name: "index_clients_on_phone_number", unique: true
  end

  create_table "incomes", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.float "amount", null: false
    t.bigint "category_id", null: false
    t.bigint "client_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "comment", null: false
    t.index ["category_id"], name: "index_incomes_on_category_id"
    t.index ["client_id"], name: "index_incomes_on_client_id"
    t.index ["user_id"], name: "index_incomes_on_user_id"
  end

  create_table "outcomes", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.float "amount", null: false
    t.bigint "category_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "comment", limit: 100, null: false
    t.index ["category_id"], name: "index_outcomes_on_category_id"
    t.index ["user_id"], name: "index_outcomes_on_user_id"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", limit: 100, null: false
    t.string "password", limit: 8, null: false
    t.string "email", limit: 100, null: false
    t.string "phone_number", limit: 10, null: false
    t.string "user_name", limit: 100, null: false
    t.integer "user_type", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "incomes", "categories"
  add_foreign_key "incomes", "clients"
  add_foreign_key "incomes", "users"
  add_foreign_key "outcomes", "categories"
  add_foreign_key "outcomes", "users"
end
