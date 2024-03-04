class ChangeUserTypeInUsers < ActiveRecord::Migration[7.0]
  def up
    change_column :users, :user_type, :string, default: 'adopter', null: false
    # Ensure only valid values exist before adding the check constraint
    User.where.not(user_type: ['adopter', 'admin']).update_all(user_type: 'adopter')
    add_check_constraint :users, "user_type IN ('adopter', 'admin')", name: 'user_type_check'
  end

  def down
    remove_check_constraint :users, name: 'user_type_check'
    change_column :users, :user_type, :string, default: '0', null: false
  end
end
