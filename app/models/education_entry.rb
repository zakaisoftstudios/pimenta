class EducationEntry < ApplicationRecord
  belongs_to :student_profile

  enum educational_level: [
    :hauptschulabschluss,
    :mittlere_reife,
    :fachhochschulreife,
    :allgemeine,
    :ausbildung,
    :techniker,
    :meister,
    :bachelor,
    :master,
    :doktor,
  ]

  validates :from, presence: true
  validates :school_name, presence: true
  validates :city, presence: true
  validates :country, presence: true

  validates :grade_point_average, 
    presence: true, 
    numericality: true,
    inclusion: 0..100

  validates :educational_level, presence: true
  validates :student_profile_id, presence: true
end
