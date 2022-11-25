class CreateStrengths < ActiveRecord::Migration[5.0]
  def change
    create_table :strengths do |t|
      t.string :label, null: false
      t.string :value, null: false

      t.timestamps
    end
  end
end
