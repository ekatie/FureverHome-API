class CreateFavourites < ActiveRecord::Migration[7.0]
  def change
    create_table :favourites do |t|
      t.references :user, null: false, foreign_key: { on_delete: :cascade }
      t.references :dog, null: false, foreign_key: { on_delete: :cascade }

      t.timestamps
    end

    # A unique index to ensure a user can only favourite a dog once
    add_index :favourites, [:user_id, :dog_id], unique: true, name: 'index_favourites_on_user_id_and_dog_id'
  end
end