class AddAreaOfGraduationToEducationEntry < ActiveRecord::Migration[5.0]
  def change
    add_column :education_entries, :area_of_graduation, :string
  end
end
