class StudentProfile < ApplicationRecord
  include MediaAttachable
  include StudentSearchable

  attr_accessor :total_items_count

  has_one :user, as: :profile
  has_many :conversation_messages, as: :sender

  has_many :certificates, dependent: :destroy
  accepts_nested_attributes_for :certificates, allow_destroy: true

  has_many :education_entries, dependent: :destroy
  accepts_nested_attributes_for :education_entries, allow_destroy: true

  has_many :work_experiences, dependent: :destroy
  accepts_nested_attributes_for :work_experiences, allow_destroy: true

  has_many :student_profile_skills, dependent: :destroy
  has_many :skills, through: :student_profile_skills
  accepts_nested_attributes_for :student_profile_skills, allow_destroy: true

  has_many :student_profile_interests, dependent: :destroy
  has_many :interests, through: :student_profile_interests
  accepts_nested_attributes_for :student_profile_interests, allow_destroy: true

  has_many :student_profile_strengths, dependent: :destroy
  has_many :strengths, through: :student_profile_strengths
  accepts_nested_attributes_for :student_profile_strengths, allow_destroy: true

  has_many :hunted_by, foreign_key: :student_profile_id, class_name: :Hunt
  has_many :likes, dependent: :destroy
  has_many :hunts, dependent: :destroy
  has_many :conversations, dependent: :destroy
  has_many :subject_likes, dependent: :destroy

  alias_method :student_likes,  :likes

  enum gender: [:m, :f, :x]
  enum mobility: [:yes, :no, :opnv]
  
  enum current_job_status: [
    :schuler, :student, :praktikant, :trainee, :teilzeitangestellt, :vollzeitangestellt, :arbeitsuchend
  ]

  enum highest_graduation_level: [
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

  validates :user, presence: true
  validates :name, presence: true
  validates :gender, presence: true, on: :update
  validates :highest_graduation_level, presence: true, on: :update
  validates :graduation, presence: true, on: :update
  validates :country, presence: true, on: :update
  validates :city, presence: true, on: :update
  validates :postal_code, presence: true, on: :update
  validates :latitude, presence: true, on: :update
  validates :longitude, presence: true, on: :update
  validates :street, presence: true, on: :update
  validates :current_job_status, presence: true, on: :update

  validates :grade_point_average, 
    presence: true, 
    numericality: true,
    inclusion: 0..100,
    on: :update

  validates :driving_license, :inclusion => { in: [true, false] }, on: :update
  validates :available_from, presence: true, on: :update
  validates :mobility, presence: true, on: :update
  validates :date_of_birth, presence: true, on: :update
  
  validates :student_profile_skills, 
    length: { minimum: 1, maximum: 5 },
    on: :update

  validates :student_profile_interests, 
    length: { minimum: 1, maximum: 5 },
    on: :update

  validates :student_profile_strengths, 
    length: { minimum: 1, maximum: 5 },
    on: :update

  validates :certificates, length: { maximum: 5 }, on: :update

  validates_with AttachmentsValidator, 
    regular: 3, 
    video: 1, 
    avatar: 1, 
    about: 1,
    cover: 1

  reverse_geocoded_by :latitude, :longitude

  def age
    if date_of_birth
      Nxt::Util::Age.calculate(date_of_birth: date_of_birth)
    else
      nil
    end
  end
end
