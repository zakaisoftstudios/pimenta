class ChangeSubjectNummerusClaususToFloat < ActiveRecord::Migration[5.0]
  def change
    remove_column :subject_offers, :nummerus_clausus
    add_column :subject_offers, :nummerus_clausus, :float
  end
end
