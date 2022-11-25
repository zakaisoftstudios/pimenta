class CreateCertificates < ActiveRecord::Migration[5.0]
  def change
    create_table :certificates do |t|
      t.references :student_profile, foreign_key: true
      t.string :pdf

      t.timestamps
    end
  end
end
