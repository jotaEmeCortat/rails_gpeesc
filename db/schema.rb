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

ActiveRecord::Schema[7.0].define(version: 2024_04_17_101721) do
  create_table "authors", force: :cascade do |t|
    t.string "name"
    t.string "qualification"
    t.string "lattes"
    t.string "avatar_img"
    t.boolean "member"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["slug"], name: "index_authors_on_slug", unique: true
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "publications", force: :cascade do |t|
    t.string "title"
    t.integer "year"
    t.text "abstract"
    t.string "theme"
    t.string "publication_type"
    t.string "cover_img"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["slug"], name: "index_publications_on_slug", unique: true
  end

  create_table "repositories", force: :cascade do |t|
    t.integer "author_id", null: false
    t.integer "publication_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["author_id"], name: "index_repositories_on_author_id"
    t.index ["publication_id"], name: "index_repositories_on_publication_id"
    t.index ["slug"], name: "index_repositories_on_slug", unique: true
  end

  add_foreign_key "repositories", "authors"
  add_foreign_key "repositories", "publications"
end
