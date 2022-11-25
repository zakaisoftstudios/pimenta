class UniversityProfile < ApplicationRecord
  include MediaAttachable
  attr_accessor :images

  attr_accessor :total_items_count

  enum type_of_university: [:public, :private], _prefix: :type

  has_one   :user, as: :profile
  has_many  :conversations
  has_many :links
  has_many :subject_offers, dependent: :destroy
  has_many :subject_likes, through: :subject_offers

  validates :name, presence: true
  validates :user, presence: true
  validates :type_of_university, presence: true, on: :update
  validates :number_of_students, 
    numericality: true, 
    allow_blank: true, 
    on: :update
  validates :we_are, presence: true, on: :update
  validates :why_should_you_study_here, presence: true, on: :update
  validates :subject_areas, presence: true, on: :update
  validates :special_features, presence: true, on: :update
  validates :country, presence: true, on: :update
  validates :city, presence: true, on: :update
  validates :postal_code, presence: true, on: :update
  validates :latitude, presence: true, on: :update
  validates :longitude, presence: true, on: :update
  validates :street, presence: true, on: :update
  validates_with AttachmentsValidator, 
    regular: 3, 
    video: 1, 
    avatar: 1, 
    about: 1,
    cover: 1

  reverse_geocoded_by :latitude, :longitude
end
