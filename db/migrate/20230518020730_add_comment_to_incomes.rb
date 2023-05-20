class AddCommentToIncomes < ActiveRecord::Migration[7.0]
  def change
    add_column :incomes, :comment, :string, null: false
  end
end
