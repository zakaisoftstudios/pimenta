class JobOffer < ApplicationRecord
  include MediaAttachable
  include JobOfferSearchable

  attr_accessor :total_items_count

  belongs_to :company_profile
  has_many :likes, dependent: :destroy

  has_many :job_offer_skills, dependent: :destroy
  accepts_nested_attributes_for :job_offer_skills, allow_destroy: true
  has_many :skills, through: :job_offer_skills

  has_many :job_offer_interests, dependent: :destroy
  accepts_nested_attributes_for :job_offer_interests, allow_destroy: true
  has_many :interests, through: :job_offer_interests

  has_many :job_offer_strengths, dependent: :destroy
  accepts_nested_attributes_for :job_offer_strengths, allow_destroy: true
  has_many :strengths, through: :job_offer_strengths

  enum category:      [
    :aprenticeship, 
    :trainee, 
    :internship, 
    :job, 
    :student_employee,
    :int_degree_program
  ]

  enum state:         [:published, :unpublished]
  enum wage_period:   [:weekly, :montly, :hourly, :yearly]
  
  enum minimum_degree: [
    :quereinstieg_ohne_abschluss,
    :quereinstieg_mit_abschluss,
    :hauptschulabschluss,
    :mittlere_reife,
    :fachhochschulreife,
    :allgemeine_hochschulreife,
    :ausbildung,
    :techniker,
    :meister,
    :bachelor,
    :master,
    :doktor
  ]

  validates :content, presence: true
  validates :category, presence: true
  validates :city, presence: true
  validates :country, presence: true
  validates :postal_code, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :start, presence: true
  validates_date :start, on_or_after: :today, if: :start_changed?
  validates_date :end_date, after: :start, allow_blank: true
  validates :working_hours_per_week,
    numericality: true,
    inclusion: 1..50,
    allow_blank: true
  validates :wage, 
    numericality: { greater_than: 0, allow_nil: true }
  validates :minimum_degree, presence: true
  validates :what_is_expected_from_us, presence: true
  validates :what_is_expected_from_you, presence: true
  validates :tasks, presence: true
  validates :perspectives, presence: true
  validates :company_profile_id, presence: true
  validates :street, presence: true
  validates :web_site_link, url: true, allow_blank: true, on: :update
  validates_with QualitiesValidator, prefix: 'job_offer'
  validates_with AttachmentsValidator, main: 1, regular: 3, video: 1

  reverse_geocoded_by :latitude, :longitude

  amoeba do
    enable
  end
end
