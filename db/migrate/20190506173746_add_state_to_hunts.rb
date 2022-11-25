class AddStateToHunts < ActiveRecord::Migration[5.0]
  def change
    change_table :hunts do |t|
      t.remove :student_liked_back
      t.remove :student_rejected
      t.integer :state, default: 0, null: false
    end
  end
end
