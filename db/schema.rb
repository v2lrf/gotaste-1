# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_06_27_080730) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "areas", force: :cascade do |t|
    t.string "name", null: false
    t.string "slug", null: false
    t.integer "parent_id"
    t.float "latitude", null: false
    t.float "longitude", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["parent_id"], name: "index_areas_on_parent_id"
    t.index ["slug"], name: "index_areas_on_slug", unique: true
  end

  create_table "locations", force: :cascade do |t|
    t.string "locatable_type", null: false
    t.bigint "locatable_id", null: false
    t.string "street_name", null: false
    t.string "street_number", null: false
    t.string "postal_code", null: false
    t.string "city", null: false
    t.string "latitude", null: false
    t.string "longitude", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["locatable_type", "locatable_id"], name: "index_locations_on_locatable_type_and_locatable_id"
  end

  create_table "places", force: :cascade do |t|
    t.string "name", null: false
    t.string "slug", null: false
    t.bigint "area_id", null: false
    t.integer "category", null: false
    t.string "website"
    t.string "email"
    t.string "phone_number"
    t.text "description"
    t.string "short_description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "active", default: false, null: false
    t.index ["area_id"], name: "index_places_on_area_id"
    t.index ["slug"], name: "index_places_on_slug", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "role", default: 0, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "places", "areas"
end
