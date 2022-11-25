class AddIsProfileAvatarAndIsCoverImageToAttachments < ActiveRecord::Migration[5.0]
  def change
  	add_column	:attachments,			:is_avatar_image,			:boolean,		default: false
  	add_column	:attachments,			:is_cover_image,		  :boolean,		default: false
  	add_column	:attachments,			:is_about_image,		  :boolean,		default: false
  end
end
