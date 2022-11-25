class AdminProfile < ApplicationRecord
  include MediaAttachable
  attr_accessor :images
  has_one :user, as: :profile
  validates :user, presence: true
  def profile_complete
    true
  end
end
