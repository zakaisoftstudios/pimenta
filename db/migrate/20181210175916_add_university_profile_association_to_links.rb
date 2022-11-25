class AddUniversityProfileAssociationToLinks < ActiveRecord::Migration[5.0]
  def change
  	add_column	:links,	:university_profile_id,		:integer,		index: true
  end
end
