class AddCompanyProfileToSubjectLike < ActiveRecord::Migration[5.0]
  def change
    add_reference :subject_likes, :company_profile, foreign_key: true
  end
end
