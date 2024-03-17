class CreateDogs < ActiveRecord::Migration[7.0]
  def change
    create_table :dogs do |t|
      t.string :name, null: false
      t.decimal :age, null: false, precision: 4, scale: 1
      t.string :sex, null: false
      t.string :breed, null: false
      t.integer :size, null: false
      t.text :description, null: false
      t.string :status, null: false, default: 'available'
      t.string :energy_level, null: false
      t.string :social_media_link
      t.string :good_with_dogs, null: false, default: 'Untested'
      t.string :good_with_cats, null: false, default: 'Untested'
      t.string :good_with_kids, null: false, default: 'Untested'
      t.string :foster_location, null: false
      t.text :medical_conditions, null: false
      t.decimal :adoption_fee, null: false

      t.timestamps
    end

    add_check_constraint :dogs, "good_with_dogs IN ('Yes', 'No', 'Sometimes', 'Untested')", name: 'check_good_with_dogs_values'
    add_check_constraint :dogs, "good_with_cats IN ('Yes', 'No', 'Sometimes', 'Untested')", name: 'check_good_with_cats_values'
    add_check_constraint :dogs, "good_with_kids IN ('Yes', 'No', 'Sometimes', 'Untested')", name: 'check_good_with_kids_values'
    add_check_constraint :dogs, "sex IN ('Male', 'Female')", name: 'check_dogs_sex'
    add_check_constraint :dogs, "status IN ('Available', 'Applications Being Reviewed', 'Pending Adoption', 'Adopted')", name: 'check_dogs_status'
    add_check_constraint :dogs, "energy_level IN ('Low', 'Medium', 'High', 'Very High')", name: 'check_dogs_energy_level'

  end
end
