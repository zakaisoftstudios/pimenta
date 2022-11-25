class AddImageableToProfileImages < ActiveRecord::Migration[5.0]
  def change
    change_table :profile_images do |t|
      t.references :imageable, polymorphic: true, index: true
    end
  end
end
