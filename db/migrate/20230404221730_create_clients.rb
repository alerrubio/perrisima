class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.string :name, limit: 100, null: false

      t.timestamps
    end
  end
end
