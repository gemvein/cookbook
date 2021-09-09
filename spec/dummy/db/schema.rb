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

ActiveRecord::Schema.define(version: 2021_09_09_165918) do

  create_table "doodads", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["slug"], name: "index_ingredients_on_slug", unique: true
  end

  create_table "recipes", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["slug"], name: "index_recipes_on_slug", unique: true
  end

  create_table "things", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.boolean "admin", default: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "uses", force: :cascade do |t|
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
    t.index ["use_in_type", "use_in_id"], name: "index_uses_on_use_in"
    t.index ["use_of_type", "use_of_id"], name: "index_uses_on_use_of"
  end

  create_table "works_cited_citations", force: :cascade do |t|
    t.string "citation_type"
    t.string "media"
    t.string "title"
    t.string "container_title"
    t.string "publisher"
    t.string "city"
    t.string "edition"
    t.string "volume"
    t.string "number"
    t.string "series"
    t.string "year"
    t.string "pages"
    t.string "url"
    t.string "online_database"
    t.string "doi"
    t.datetime "published_at"
    t.datetime "accessed_at"
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["record_type", "record_id"], name: "index_works_cited_citations_on_record"
  end

  create_table "works_cited_contributors", force: :cascade do |t|
    t.integer "works_cited_citation_id", null: false
    t.string "contributor_role"
    t.string "first"
    t.string "middle"
    t.string "last"
    t.string "suffix"
    t.string "handle"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["works_cited_citation_id"], name: "index_works_cited_contributors_on_works_cited_citation_id"
  end

  add_foreign_key "works_cited_contributors", "works_cited_citations"
end
