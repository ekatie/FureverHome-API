class CreateApplications < ActiveRecord::Migration[7.0]
  def change
    create_table :applications do |t|
      t.references :user, null: false, foreign_key: true
      t.string :status, null: false
      t.datetime :application_date
      t.datetime :interview_date
      t.datetime :meet_greet_date
      t.datetime :adoption_date
      t.boolean :read_profile, null: false
      t.string :address, null: false
      t.boolean :current_pets, null: false
      t.text :current_pets_details
      t.boolean :felony_conviction, null: false
      t.text :felony_details
      t.boolean :pet_prohibition, null: false
      t.text :prohibition_details
      t.boolean :previous_adoption, null: false
      t.text :adoption_details
      t.string :residence_type, null: false
      t.boolean :landlord_permission
      t.string :occupation, null: false
      t.text :adoption_reason, null: false
      t.text :dog_experience, null: false
      t.text :stimulation_plan, null: false
      t.boolean :household_children, null: false
      t.boolean :household_allergies, null: false
      t.boolean :household_agreement, null: false
      t.text :sleeping_arrangement, null: false
      t.text :vet_frequency, null: false

      t.timestamps
    end
    add_check_constraint :residence_type, "residence_type IN ('rent', 'own')", name: 'check_residence_type_values'
  end
end
