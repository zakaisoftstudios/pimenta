class AddMinimumGraduationToJobOffer < ActiveRecord::Migration[5.0]
  def change
  	add_column	:job_offers,				:minimum_graduation,			:string
  end
end
