class ReduceMultipleFlagsOnAttachments < ActiveRecord::Migration[5.0]
  def change
  	remove_column	:attachments,		:is_avatar_image,		:string
  	remove_column	:attachments,		:is_cover_image,		:string
  	remove_column	:attachments,		:is_about_image,		:string

  	add_column		:attachments,		:purpose,					  :integer
  end
end
