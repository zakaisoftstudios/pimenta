class AddTitleToCertificates < ActiveRecord::Migration[5.0]
  def change
    add_column :certificates, :title, :string, null: false
  end
end
