class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.string 				:name
      t.string 				:description
      t.references 		:university_profile

      t.timestamps
    end
  end
end
