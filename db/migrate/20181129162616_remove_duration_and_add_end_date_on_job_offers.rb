class RemoveDurationAndAddEndDateOnJobOffers < ActiveRecord::Migration[5.0]
  def change
  	remove_column	:job_offers,		:duration,	:integer
  	add_column		:job_offers,		:end_date,	:date
  end
end
