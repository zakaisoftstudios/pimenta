class AlterDriverLicenceColumnInStudents < ActiveRecord::Migration[5.0]
  def change
  	remove_column	:student_profiles,	:driving_license,		:string
  	add_column		:student_profiles,	:driving_license,		:boolean
  end
end
