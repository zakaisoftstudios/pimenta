class AddProfileToUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :profile, polymorphic: true, index: true
  end
end
