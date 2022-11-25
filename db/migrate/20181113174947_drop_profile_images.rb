class DropProfileImages < ActiveRecord::Migration[5.0]
  def change
  	drop_table :profile_images
  end
end
