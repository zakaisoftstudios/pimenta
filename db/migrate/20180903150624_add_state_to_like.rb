class AddStateToLike < ActiveRecord::Migration[5.0]
  def change
    add_column :likes, :state, :integer, default: 0
  end
end
