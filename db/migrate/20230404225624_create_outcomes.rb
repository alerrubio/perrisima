class CreateOutcomes < ActiveRecord::Migration[7.0]
  def change
    create_table :outcomes do |t|
      t.float :amount, null: false
      t.references :category, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
