class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name, limit: 100, null: false
      t.string :password, limit: 8, null: false
      t.string :email, limit: 100, null: false, unique: true
      t.string :phone_number, limit: 10, null: false
      t.string :user_name, limit: 100, null: false
      t.integer :user_type, null: false, default: 1

      t.timestamps
    end
  end
end
