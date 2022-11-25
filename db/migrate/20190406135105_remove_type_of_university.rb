class RemoveTypeOfUniversity < ActiveRecord::Migration[5.0]
  def change
    remove_column :university_profiles, :type_of_university
  end
end
