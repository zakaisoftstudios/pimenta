class AddWagePeriodOnJobOffers < ActiveRecord::Migration[5.0]
  def change
  	add_column	:job_offers,		:wage_period,			:integer
  end
end
