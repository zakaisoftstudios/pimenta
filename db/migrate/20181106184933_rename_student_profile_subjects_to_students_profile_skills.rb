class RenameStudentProfileSubjectsToStudentsProfileSkills < ActiveRecord::Migration[5.0]
  def change
  	rename_table 	:student_profile_subjects,		:student_profile_skills
  	rename_column	:student_profile_skills,			:subject_id,								:skill_id
  end
end
