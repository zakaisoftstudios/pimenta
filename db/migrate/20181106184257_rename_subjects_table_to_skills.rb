class RenameSubjectsTableToSkills < ActiveRecord::Migration[5.0]
  def change
  	rename_table :subjects,		:skills
  end
end
