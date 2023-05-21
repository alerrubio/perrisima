class ChangeCommentLimitInIncomes < ActiveRecord::Migration[7.0]
  def change
    change_column :incomes, :comment, :string, limit: 10000
  end
end
