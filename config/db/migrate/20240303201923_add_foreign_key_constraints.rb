class AddForeignKeyConstraints < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :dogs, :dog_images, column: :default_image_id
  end
end
