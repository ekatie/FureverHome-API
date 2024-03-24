class CreateApplications < ActiveRecord::Migration[7.0]
  def change
    create_table :applications do |t|
      t.references :user, null: false, foreign_key: true
      t.string :status, null: false
      t.datetime :application_date
      t.datetime :interview_date
      t.datetime :meet_greet_date
      t.datetime :adoption_date
      t.boolean :read_profile
      t.string :address
      t.boolean :current_pets
      t.text :current_pets_details
      t.boolean :felony_conviction
      t.text :felony_details
      t.boolean :pet_prohibition
      t.text :prohibition_details
      t.boolean :previous_adoption
      t.text :adoption_details
      t.string :residence_type
      t.boolean :landlord_permission
      t.string :occupation
      t.text :adoption_reason
      t.text :dog_experience
      t.text :stimulation_plan
      t.boolean :household_children
      t.boolean :household_allergies
      t.boolean :household_agreement
      t.text :sleeping_arrangement
      t.text :vet_frequency
      t.boolean :is_contract_signed, default: false
      t.boolean :is_fee_paid, default: false
      t.binary :signed_contract

      t.timestamps
    end
    add_check_constraint :applications, "residence_type IN ('Rent', 'Own')", name: 'check_residence_type_values'
  end
end
