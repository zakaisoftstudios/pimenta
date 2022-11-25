class ChangeJobOfferMinimumGraduationToEnum < ActiveRecord::Migration[5.0]
  def change
    remove_column :job_offers, :minimum_graduation
    add_column :job_offers, :minimum_degree, :integer
  end
end
