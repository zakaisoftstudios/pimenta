class CompanyProfile < ApplicationRecord
  include MediaAttachable
  attr_accessor :images, :total_items_count

  has_one   :user, as: :profile
  has_many  :job_offers, dependent: :destroy
  has_many  :hunts, dependent: :destroy
  has_many  :conversations, dependent: :destroy
  has_many  :conversation_messages, as: :sender, dependent: :destroy
  has_many  :links, dependent: :destroy
  has_many  :subject_likes, dependent: :destroy

  validates :user, presence: true
  validates :name, presence: true

  validates :contact_email,
    format: { with: URI::MailTo::EMAIL_REGEXP },
    allow_blank: true,
    on: :update

  validates :city, presence: true, on: :update
  validates :country, presence: true, on: :update
  validates :postal_code, presence: true, on: :update
  validates :latitude, presence: true, on: :update
  validates :longitude, presence: true, on: :update
  validates :street, presence: true, on: :update
  validates :industry_sector, presence: true, on: :update

  validates :number_of_employees, 
    presence: true, 
    numericality: { only_integer: true, greater_than_or_equal_to: 0 },
    on: :update

  validates_with AttachmentsValidator, 
    regular: 3, 
    video: 1, 
    avatar: 1, 
    about: 1,
    cover: 1

  validates :what_we_do, presence: true, on: :update
  validates :why_we_do_it, presence: true, on: :update
  validates :why_you_should_join_our_team, presence: true, on: :update
  validates :home_page, url: true, allow_blank: true, on: :update
  validates :facebok_link, url: true, allow_blank: true, on: :update
  validates :youtube_link, url: true, allow_blank: true, on: :update
  validates :twitter_link, url: true, allow_blank: true, on: :update
  validates :instagram_link, url: true, allow_blank: true, on: :update

  reverse_geocoded_by :latitude, :longitude
  after_commit  :reindex_job_offers

  private

  def reindex_job_offers
    job_offers.reindex
  end
end
