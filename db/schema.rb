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

ActiveRecord::Schema[7.0].define(version: 2024_03_01_191952) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "application_dog_matches", force: :cascade do |t|
    t.bigint "application_id", null: false
    t.bigint "dog_id", null: false
    t.decimal "match_percentage", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["application_id"], name: "index_application_dog_matches_on_application_id"
    t.index ["dog_id"], name: "index_application_dog_matches_on_dog_id"
  end

  create_table "applications", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "status", null: false
    t.datetime "application_date"
    t.datetime "interview_date"
    t.datetime "meet_greet_date"
    t.datetime "adoption_date"
    t.boolean "read_profile", null: false
    t.string "address", null: false
    t.string "current_pets", null: false
    t.boolean "felony_conviction", null: false
    t.text "felony_details"
    t.boolean "pet_prohibition", null: false
    t.text "prohibition_details"
    t.boolean "previous_adoption", null: false
    t.text "adoption_details"
    t.string "residence_type", null: false
    t.boolean "landlord_permission"
    t.string "occupation", null: false
    t.text "adoption_reason", null: false
    t.text "dog_experience", null: false
    t.text "stimulation_plan", null: false
    t.boolean "household_children", null: false
    t.boolean "household_allergies", null: false
    t.boolean "household_agreement", null: false
    t.text "sleeping_arrangement", null: false
    t.text "vet_frequency", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_applications_on_user_id"
  end

  create_table "dog_images", force: :cascade do |t|
    t.bigint "dog_id", null: false
    t.string "url", null: false
    t.boolean "is_default", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dog_id"], name: "index_dog_images_on_dog_id"
  end

  create_table "dogs", force: :cascade do |t|
    t.string "name", null: false
    t.string "age", null: false
    t.string "sex", null: false
    t.string "breed", null: false
    t.string "size", null: false
    t.text "description", null: false
    t.string "status", null: false
    t.string "energy_level", null: false
    t.string "social_media_link"
    t.string "good_with_dogs", null: false
    t.string "good_with_cats", null: false
    t.string "good_with_kids", null: false
    t.string "foster_location", null: false
    t.text "medical_conditions", null: false
    t.decimal "adoption_fee", null: false
    t.integer "default_image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["default_image_id"], name: "index_dogs_on_default_image_id"
  end

  create_table "favourites", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "dog_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dog_id"], name: "index_favourites_on_dog_id"
    t.index ["user_id"], name: "index_favourites_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", limit: 255, null: false
    t.string "password_digest", null: false
    t.string "user_type", default: "0", null: false
    t.string "name", limit: 100, null: false
    t.date "date_of_birth", null: false
    t.string "phone", limit: 15, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "application_dog_matches", "applications"
  add_foreign_key "application_dog_matches", "dogs"
  add_foreign_key "applications", "users"
  add_foreign_key "dog_images", "dogs"
  add_foreign_key "favourites", "dogs"
  add_foreign_key "favourites", "users"
end
