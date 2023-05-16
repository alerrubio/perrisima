class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.string :name, limit: 100, null: false
      t.string :phone_number, limit: 10, null: false, unique: true

      t.timestamps
    end
  end
end
