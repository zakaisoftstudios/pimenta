class AddWorkingHoursPerWeekToJobOffers < ActiveRecord::Migration[5.0]
  def change
  	add_column	:job_offers,		:working_hours_per_week,		:integer
  end
end
