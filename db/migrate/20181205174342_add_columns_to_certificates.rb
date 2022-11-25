class AddColumnsToCertificates < ActiveRecord::Migration[5.0]
  def change
  	add_column	:certificates,			:finished_at,						:date
  	add_column	:certificates,			:institution_name,			:string
  end
end
