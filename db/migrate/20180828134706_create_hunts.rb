class CreateHunts < ActiveRecord::Migration[5.0]
  def change
    create_table :hunts do |t|
      t.references :company_profile, foreign_key: true
      t.references :student_profile, foreign_key: true

      t.timestamps
    end
  end
end
