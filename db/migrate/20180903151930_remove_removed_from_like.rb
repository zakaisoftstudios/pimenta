class RemoveRemovedFromLike < ActiveRecord::Migration[5.0]
  def change
    remove_column :likes, :removed
  end
end
