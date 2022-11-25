class CreateJobOffers < ActiveRecord::Migration[5.0]
  def change
    create_table :job_offers do |t|
      t.string :picture, null: false
      t.integer :category, null: false
      t.text :content, null: false
      t.text :what_we_expect_from_you, null: false
      t.text :what_you_can_expect_from_us, null: false
      t.text :what_we_need_from_you, null: false
      t.string :city, null: false
      t.date :start, null: false
      t.integer :duration, null: false
      t.decimal :wage, precision: 8, scale: 2, null: false
      t.integer :free_places, null: false

      t.timestamps
    end
  end
end
