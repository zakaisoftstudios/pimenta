class AddStateToJobOffers < ActiveRecord::Migration[5.0]
  def change
    add_column :job_offers, :state, :integer, default: 0
  end
end
