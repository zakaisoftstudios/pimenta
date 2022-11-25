class RemovePictureColumnFromJobOffer < ActiveRecord::Migration[5.0]
  def change
  	remove_column	:job_offers,		:picture,		:string
  end
end
