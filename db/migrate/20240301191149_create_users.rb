class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email, null: false, index: { unique: true }, limit: 255
      t.string :password_digest, null: false
      t.string :user_type, null: false, default: 'adopter'
      t.string :name, null: false, limit: 100
      t.date :date_of_birth, null: false
      t.string :phone, null: false, limit: 15

      t.timestamps
    end
  end
end
