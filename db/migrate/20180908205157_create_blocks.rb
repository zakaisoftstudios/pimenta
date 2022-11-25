class CreateBlocks < ActiveRecord::Migration[5.0]
  def change
    create_table :blocks do |t|
      t.references :student_profile, foreign_key: true
      t.references :company_profile, foreign_key: true

      t.timestamps
    end
  end
end
