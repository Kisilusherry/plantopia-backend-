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

ActiveRecord::Schema[7.1].define(version: 2024_05_16_034735) do
  create_table "carts", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "plant_id", null: false
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plant_id"], name: "index_carts_on_plant_id"
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "plant_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plant_id"], name: "index_favorites_on_plant_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "plants", force: :cascade do |t|
    t.string "name"
    t.decimal "price"
    t.string "climate"
    t.text "description"
    t.string "image"
    t.text "additional_info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "regions", force: :cascade do |t|
    t.string "name"
    t.string "climate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "carts", "plants"
  add_foreign_key "carts", "users"
  add_foreign_key "favorites", "plants"
  add_foreign_key "favorites", "users"
end
