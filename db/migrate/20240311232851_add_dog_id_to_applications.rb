class AddDogIdToApplications < ActiveRecord::Migration[7.0]
  def change
    add_column :applications, :dog_id, :bigint
  end
end
