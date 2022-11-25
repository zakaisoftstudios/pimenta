class AddStudentRejectedToHunt < ActiveRecord::Migration[5.0]
  def change
    add_column :hunts, :student_rejected, :boolean, default: false
  end
end
