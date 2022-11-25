class CreateWorkExperiences < ActiveRecord::Migration[5.0]
  def change
    create_table :work_experiences do |t|
      t.date :from, null: false
      t.date :to, null: false
      t.integer :kind, null: false
      t.string :company_name, null: false
      t.string :department, null: false
      t.string :city, null: false
      t.string :country, null: false
      t.string :title, null: false
      t.text :tasks
      t.references :student_profile, foreign_key: true

      t.timestamps
    end
  end
end
