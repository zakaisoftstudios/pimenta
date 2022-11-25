class ChangeWorkExperiencesTo < ActiveRecord::Migration[5.0]
  def change
    change_table :work_experiences do |t|
      t.remove :to
      t.date :to
    end
  end
end
