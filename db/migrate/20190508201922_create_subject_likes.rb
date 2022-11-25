class CreateSubjectLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :subject_likes do |t|
      t.references :subject_offer, foreign_key: true
      t.references :student_profile, foreign_key: true

      t.timestamps
    end
  end
end
