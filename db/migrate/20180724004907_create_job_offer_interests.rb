class CreateJobOfferInterests < ActiveRecord::Migration[5.0]
  def change
    create_table :job_offer_interests do |t|
      t.references :job_offer, foreign_key: true
      t.references :interest, foreign_key: true
      t.boolean :must_have, null: false, default: false

      t.timestamps
    end
  end
end
