class AddEducationalLevelToEducationEntry < ActiveRecord::Migration[5.0]
  def change
    add_column :education_entries, :educational_level, :integer, null: false
  end
end
