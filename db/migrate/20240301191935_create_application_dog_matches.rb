class CreateApplicationDogMatches < ActiveRecord::Migration[7.0]
  def change
    create_table :application_dog_matches do |t|
      t.references :application, null: false, foreign_key: true
      t.references :dog, null: false, foreign_key: true
      t.decimal :match_percentage, null: false, precision: 5, scale: 2

      t.timestamps
    end
    add_index :application_dog_matches, [:application_id, :dog_id], unique: true, name: 'index_on_application_id_and_dog_id'

    # Add a check constraint for match_percentage between 0 and 100
    reversible do |dir|
      dir.up do
        execute <<-SQL
          ALTER TABLE application_dog_matches
          ADD CONSTRAINT match_percentage_check
          CHECK (match_percentage >= 0 AND match_percentage <= 100);
        SQL
      end
      dir.down do
        execute <<-SQL
          ALTER TABLE application_dog_matches
          DROP CONSTRAINT match_percentage_check;
        SQL
      end
    end
  end
end
