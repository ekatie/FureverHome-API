class CreateDogImages < ActiveRecord::Migration[7.0]
  def change
    create_table :dog_images do |t|
      t.references :dog, null: false, foreign_key: true
      t.string :url, null: false
      t.boolean :is_default, null: false, default: false

      t.timestamps
    end
    add_index :dog_images, [:dog_id, :is_default], unique: true, where: 'is_default = true'
  end
end
