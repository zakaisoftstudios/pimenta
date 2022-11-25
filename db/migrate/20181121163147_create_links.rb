class CreateLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :links do |t|
      t.string 			:text
      t.string 			:url
      t.integer 		:kind
      t.references 	:company_profile

      t.timestamps
    end
  end
end
