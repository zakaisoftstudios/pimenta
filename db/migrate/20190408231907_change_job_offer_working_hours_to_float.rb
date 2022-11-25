class ChangeJobOfferWorkingHoursToFloat < ActiveRecord::Migration[5.0]
  def change
    remove_column :job_offers, :working_hours_per_week
    add_column :job_offers, :working_hours_per_week, :float
  end
end
