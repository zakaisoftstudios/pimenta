class RenameResourceColumnOnAttachments < ActiveRecord::Migration[5.0]
  def change
  	rename_column	:attachments,		:resource,		:picture
  	add_column		:attachments,		:video,				:string
  end
end
