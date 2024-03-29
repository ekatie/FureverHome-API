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

ActiveRecord::Schema[7.0].define(version: 2024_03_23_185610) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "application_dog_matches", force: :cascade do |t|
    t.bigint "application_id", null: false
    t.bigint "dog_id", null: false
    t.decimal "match_percentage", precision: 5, scale: 2, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["application_id", "dog_id"], name: "index_on_application_id_and_dog_id", unique: true
    t.index ["application_id"], name: "index_application_dog_matches_on_application_id"
    t.index ["dog_id"], name: "index_application_dog_matches_on_dog_id"
    t.check_constraint "match_percentage >= 0::numeric AND match_percentage <= 100::numeric", name: "match_percentage_check"
  end

  create_table "applications", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "status", null: false
    t.datetime "application_date"
    t.datetime "interview_date"
    t.datetime "meet_greet_date"
    t.datetime "adoption_date"
    t.boolean "read_profile"
    t.string "address"
    t.boolean "current_pets"
    t.text "current_pets_details"
    t.boolean "felony_conviction"
    t.text "felony_details"
    t.boolean "pet_prohibition"
    t.text "prohibition_details"
    t.boolean "previous_adoption"
    t.text "adoption_details"
    t.string "residence_type"
    t.boolean "landlord_permission"
    t.string "occupation"
    t.text "adoption_reason"
    t.text "dog_experience"
    t.text "stimulation_plan"
    t.boolean "household_children"
    t.boolean "household_allergies"
    t.boolean "household_agreement"
    t.text "sleeping_arrangement"
    t.text "vet_frequency"
    t.boolean "is_contract_signed", default: false
    t.boolean "is_fee_paid", default: false
    t.binary "signed_contract"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "dog_age"
    t.string "dog_size"
    t.string "dog_energy_level"
    t.text "dog_medical_conditions"
    t.bigint "dog_id"
    t.index ["user_id"], name: "index_applications_on_user_id"
    t.check_constraint "dog_energy_level::text = ANY (ARRAY['Low'::character varying, 'Medium'::character varying, 'High'::character varying, 'Very High'::character varying, 'Flexible'::character varying]::text[])", name: "check_applications_dog_energy_level"
    t.check_constraint "residence_type::text = ANY (ARRAY['Rent'::character varying, 'Own'::character varying]::text[])", name: "check_residence_type_values"
  end

  create_table "dog_images", force: :cascade do |t|
    t.bigint "dog_id", null: false
    t.string "url", null: false
    t.boolean "is_default", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dog_id", "is_default"], name: "index_dog_images_on_dog_id_and_is_default", unique: true, where: "(is_default = true)"
    t.index ["dog_id"], name: "index_dog_images_on_dog_id"
  end

  create_table "dogs", force: :cascade do |t|
    t.string "name", null: false
    t.decimal "age", precision: 4, scale: 1, null: false
    t.string "sex", null: false
    t.string "breed", null: false
    t.integer "size", null: false
    t.text "description", null: false
    t.string "status", default: "available", null: false
    t.string "energy_level", null: false
    t.string "social_media_link"
    t.string "good_with_dogs", default: "Untested", null: false
    t.string "good_with_cats", default: "Untested", null: false
    t.string "good_with_kids", default: "Untested", null: false
    t.string "foster_location", null: false
    t.text "medical_conditions", null: false
    t.decimal "adoption_fee", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.check_constraint "energy_level::text = ANY (ARRAY['Low'::character varying, 'Medium'::character varying, 'High'::character varying, 'Very High'::character varying]::text[])", name: "check_dogs_energy_level"
    t.check_constraint "good_with_cats::text = ANY (ARRAY['Yes'::character varying, 'No'::character varying, 'Sometimes'::character varying, 'Untested'::character varying]::text[])", name: "check_good_with_cats_values"
    t.check_constraint "good_with_dogs::text = ANY (ARRAY['Yes'::character varying, 'No'::character varying, 'Sometimes'::character varying, 'Untested'::character varying]::text[])", name: "check_good_with_dogs_values"
    t.check_constraint "good_with_kids::text = ANY (ARRAY['Yes'::character varying, 'No'::character varying, 'Sometimes'::character varying, 'Untested'::character varying]::text[])", name: "check_good_with_kids_values"
    t.check_constraint "sex::text = ANY (ARRAY['Male'::character varying, 'Female'::character varying]::text[])", name: "check_dogs_sex"
    t.check_constraint "status::text = ANY (ARRAY['Available'::character varying, 'Applications Being Reviewed'::character varying, 'Pending Adoption'::character varying, 'Adopted'::character varying]::text[])", name: "check_dogs_status"
  end

  create_table "favourites", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "dog_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dog_id"], name: "index_favourites_on_dog_id"
    t.index ["user_id", "dog_id"], name: "index_favourites_on_user_id_and_dog_id", unique: true
    t.index ["user_id"], name: "index_favourites_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", limit: 255, null: false
    t.string "password_digest", null: false
    t.string "user_type", default: "adopter", null: false
    t.string "name", limit: 100, null: false
    t.date "date_of_birth", null: false
    t.string "phone", limit: 15, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.check_constraint "user_type::text = ANY (ARRAY['adopter'::character varying, 'admin'::character varying]::text[])", name: "user_type_check"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "application_dog_matches", "applications"
  add_foreign_key "application_dog_matches", "dogs"
  add_foreign_key "applications", "users"
  add_foreign_key "dog_images", "dogs"
  add_foreign_key "favourites", "dogs", on_delete: :cascade
  add_foreign_key "favourites", "users", on_delete: :cascade
end
