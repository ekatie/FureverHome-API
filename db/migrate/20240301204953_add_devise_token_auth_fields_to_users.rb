class AddDeviseTokenAuthFieldsToUsers < ActiveRecord::Migration[7.0]
  def change
    ## DeviseTokenAuth fields
    add_column :users, :provider, :string, null: false, default: 'email'
    add_column :users, :uid, :string, null: false, default: ''
    add_column :users, :tokens, :json

    ## Database authenticatable
    remove_column :users, :password_digest
    add_column :users, :encrypted_password, :string, null: false, default: ''

    ## Recoverable
    add_column :users, :reset_password_token, :string
    add_column :users, :reset_password_sent_at, :datetime

    ## Rememberable
    add_column :users, :remember_created_at, :datetime

    # Indexes for efficient querying and uniqueness
    add_index :users, [:uid, :provider], unique: true
    add_index :users, :reset_password_token, unique: true
  end
end