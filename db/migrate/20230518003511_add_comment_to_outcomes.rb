class AddCommentToOutcomes < ActiveRecord::Migration[7.0]
  def change
    add_column :outcomes, :comment, :string, limit: 100, null: false
  end
end
