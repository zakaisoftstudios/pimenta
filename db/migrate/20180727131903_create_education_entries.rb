class CreateEducationEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :education_entries do |t|
      t.date :from
      t.date :to
      t.string :school_name
      t.string :city
      t.string :country
      t.decimal :grade_point_average
      t.references :student_profile, foreign_key: true

      t.timestamps
    end
  end
end
