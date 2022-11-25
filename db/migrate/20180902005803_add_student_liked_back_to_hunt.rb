class AddStudentLikedBackToHunt < ActiveRecord::Migration[5.0]
  def change
    add_column :hunts, :student_liked_back, :boolean, default: false
  end
end
