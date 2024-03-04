class AddDetailsToApplications < ActiveRecord::Migration[7.0]
  def up
    # Adding new columns
    add_column :applications, :dog_age, :string, null: false
    add_column :applications, :dog_size, :string, null: false
    add_column :applications, :dog_energy_level, :string, null: false
    add_column :applications, :dog_medical_conditions, :text, null: false

    # Adding check constraint
    add_check_constraint :applications, "dog_energy_level IN ('Low', 'Medium', 'High', 'Very High')", name: 'check_applications_dog_energy_level'
  end

  def down
    # Removing check constraint
    remove_check_constraint :applications, name: 'check_applications_dog_energy_level'

    # Removing columns
    remove_column :applications, :dog_medical_conditions
    remove_column :applications, :dog_energy_level
    remove_column :applications, :dog_size
    remove_column :applications, :dog_age
  end
end