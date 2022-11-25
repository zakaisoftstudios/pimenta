class CreateJobOfferSubject < ActiveRecord::Migration[5.0]
  def change
    create_table :job_offer_subjects do |t|
      t.references :job_offer, foreign_key: true
      t.references :subject, foreign_key: true
      t.boolean :must_have, null: false, default: false
    end
  end
end
