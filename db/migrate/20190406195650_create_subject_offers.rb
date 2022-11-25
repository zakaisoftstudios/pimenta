class CreateSubjectOffers < ActiveRecord::Migration[5.0]
  def change
    create_table :subject_offers do |t|
      t.string :name
      t.integer :type_of_degree
      t.text :content
      t.text :perspectives
      t.text :tests
      t.string :postal_code
      t.string :country
      t.string :city
      t.string :street
      t.float :latitude
      t.float :longitude
      t.date :start_date
      t.integer :duration_in_hours
      t.integer :cost_period
      t.decimal :cost_amount
      t.integer :hours_of_classes_per_week
      t.integer :number_of_places
      t.integer :nummerus_clausus
      t.integer :minimum_degree
      t.integer :state
      t.references :university_profile, foreign_key: true

      t.timestamps
    end
  end
end
