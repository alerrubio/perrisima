class ChangeEmailToBeUniqueInUsers < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :email, :string
    add_index :users, :email, unique: true
  end
end
