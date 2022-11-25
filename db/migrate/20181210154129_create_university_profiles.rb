class CreateUniversityProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :university_profiles do |t|
      t.string :name
      t.string :contact_person
      t.string :industry_sector
      t.integer :number_of_employees
      t.string :country
      t.string :city
      t.string :street
      t.string :special_features
      t.string :postal_code
      t.float :latitude
      t.float :longitude
      t.text  :we_are
      t.text  :why_should_you_study_here
      t.text  :why_we_do_it
      t.text  :subject_areas
      t.text  :partners
      t.string :type_of_university

      t.timestamps
    end
  end
end
