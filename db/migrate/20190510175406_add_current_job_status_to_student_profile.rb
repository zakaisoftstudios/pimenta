class AddCurrentJobStatusToStudentProfile < ActiveRecord::Migration[5.0]
  def change
    remove_column :student_profiles, :type_of_graduation
    add_column :student_profiles, :current_job_status, :integer
  end
end
