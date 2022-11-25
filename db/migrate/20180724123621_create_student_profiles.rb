class CreateStudentProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :student_profiles do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
