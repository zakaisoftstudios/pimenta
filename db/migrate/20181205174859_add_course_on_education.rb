class AddCourseOnEducation < ActiveRecord::Migration[5.0]
  def change
  	add_column	:education_entries,		:course,		:string
  end
end
