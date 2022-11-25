class SubjectOffer < ApplicationRecord
  attr_accessor :total_items_count

  include MediaAttachable
  include SubjectOfferSearchable

  reverse_geocoded_by :latitude, :longitude

  belongs_to :university_profile
  has_many :subject_likes, dependent: :destroy
  
  has_many :subject_offer_skills, dependent: :destroy
  accepts_nested_attributes_for :subject_offer_skills, allow_destroy: true
  has_many :skills, through: :subject_offer_skills

  has_many :subject_offer_interests, dependent: :destroy
  accepts_nested_attributes_for :subject_offer_interests, allow_destroy: true
  has_many :interests, through: :subject_offer_interests
  
  has_many :subject_offer_strengths, dependent: :destroy
  accepts_nested_attributes_for :subject_offer_strengths, allow_destroy: true
  has_many :strengths, through: :subject_offer_strengths

  enum state: [:published, :unpublished]
  enum cost_period: [:weekly, :montly, :hourly, :total]

  enum type_of_degree: [
    :certificate,
    :re_education,
    :business_economist,
    :apprenticeship,
    :bachelor_of_science,
    :bachelor_of_arts,
    :master_of_science,
    :master_of_arts,
    :pdeng,
    :phd,
    :bachelor_of_laws,
    :master_of_laws,
    :seminar,
    :dual_study
  ]
  
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

  validates :name, presence: true
  validates :state, presence: true
  validates :type_of_degree, presence: true
  validates :content, presence: true
  validates :perspectives, presence: true
  validates :tests, presence: true
  validates :postal_code, presence: true
  validates :country, presence: true
  validates :city, presence: true
  validates :street, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :start_dates, presence: true
  validates :duration_in_hours, presence: true
  validates :minimum_degree, presence: true
  validates :university_profile, presence: true
  validates :hours_of_classes_per_week,
    numericality: true,
    allow_blank: true
  validates :nummerus_clausus,
    numericality: true,
    inclusion: 1..15,
    allow_blank: true
  validates :number_of_places,
    numericality: {only_integer: true, greater_than: 0},
    allow_blank: true
  validates :cost_amount, 
    numericality: { greater_than: 0, allow_nil: true }
  validates :web_site_link, url: true, allow_blank: true, on: :update
  validates_with QualitiesValidator, prefix: 'subject_offer'
  validates_with AttachmentsValidator, main: 1, regular: 3, video: 1

  before_save :save_the_most_recent_date

  before_save :check_start_dates_format

  def check_start_dates_format
    start_dates.map {|sd|
      raise Nxt::SubjectOffer::Errors::WrongDateFormat.new('Wrong Start Date Format') unless sd&.to_time.present?
    }
  end

  def save_the_most_recent_date
    self.start_date = self.start_dates.sort{ |a,b| a <=> b }.last
  end

  amoeba do
    enable
  end
end
