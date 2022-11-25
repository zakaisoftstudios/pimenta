class AddColumnsToStudentsProfile < ActiveRecord::Migration[5.0]
  def change
  	add_column	:student_profiles,			:speciality,							:string
  	add_column	:student_profiles,			:type_of_graduation,			:string
  	add_column	:student_profiles,			:school,									:string
  end
end
