# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails cookbook to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_09_10_142323) do

  create_table "cookbook_uses", force: :cascade do |t|
    t.boolean "published", default: true
    t.string "use_in_type", null: false
    t.integer "use_in_id", null: false
    t.string "use_of_type", null: false
    t.integer "use_of_id", null: false
    t.float "quantity_minimum"
    t.float "quantity_maximum"
    t.string "unit"
    t.integer "sort"
    t.string "note"
    t.string "preparation"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["use_in_type", "use_in_id"], name: "index_cookbook_uses_on_use_in"
    t.index ["use_of_type", "use_of_id"], name: "index_cookbook_uses_on_use_of"
  end

  create_table "how_tos", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.text "description"
    t.text "instructions"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["slug"], name: "index_how_tos_on_slug", unique: true
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.text "description"
    t.string "aisle"
    t.string "store"
    t.string "cost"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["slug"], name: "index_ingredients_on_slug", unique: true
  end

  create_table "recipes", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.text "description"
    t.string "serves"
    t.string "meal"
    t.text "instructions"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["slug"], name: "index_recipes_on_slug", unique: true
  end

  create_table "supplies", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.text "description"
    t.string "source"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["slug"], name: "index_supplies_on_slug", unique: true
  end

  create_table "tools", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.text "description"
    t.string "composition"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["slug"], name: "index_tools_on_slug", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
