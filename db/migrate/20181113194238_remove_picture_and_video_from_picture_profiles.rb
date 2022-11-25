class RemovePictureAndVideoFromPictureProfiles < ActiveRecord::Migration[5.0]
  def change
  	remove_column	:company_profiles,		:picture,		:string
  	remove_column	:company_profiles,		:video,		  :string
  end
end
