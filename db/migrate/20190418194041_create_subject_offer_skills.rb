class CreateSubjectOfferSkills < ActiveRecord::Migration[5.0]
  def change
    create_table :subject_offer_skills do |t|
      t.references :subject_offer, foreign_key: true
      t.references :skill, foreign_key: true
      t.boolean :must_have, null: false, default: false
    end
  end
end
