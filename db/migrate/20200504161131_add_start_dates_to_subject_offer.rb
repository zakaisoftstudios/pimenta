class AddStartDatesToSubjectOffer < ActiveRecord::Migration[5.0]
  def change
    add_column :subject_offers, :start_dates, :string, array: true, default: []
  end
end
