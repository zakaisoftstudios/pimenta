class AddDestroyedToLikes < ActiveRecord::Migration[5.0]
  def change
    add_column :likes, :removed, :boolean, default: false
  end
end
