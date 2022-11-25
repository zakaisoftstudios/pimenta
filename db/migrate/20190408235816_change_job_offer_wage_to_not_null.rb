class ChangeJobOfferWageToNotNull < ActiveRecord::Migration[5.0]
  def change
    remove_column :job_offers, :wage
    add_column :job_offers, :wage, :decimal, precision: 8, scale: 2
  end
end
