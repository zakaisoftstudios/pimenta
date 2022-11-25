class RenameJobOfferSubjectToJobOfferSkill < ActiveRecord::Migration[5.0]
  def change
  	rename_table 	:job_offer_subjects,		:job_offer_skills
  	rename_column	:job_offer_skills,			:subject_id,					:skill_id
  end
end
