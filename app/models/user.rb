class User < ApplicationRecord
  has_secure_password

  belongs_to :profile, polymorphic: true, optional: true

  validates :email,
    presence: true,
    format: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/,
    uniqueness: true

  validates :password,
    length: { minimum: 6, if: :validate_password? }

  validates :confirm_token,
    presence: true,
    on: :create,
    unless: :facebook_id?

  def is_admin?
    profile_type == 'AdminProfile'
  end

  def send_password_reset_token
    generate_token
    self.password_reset_sent_at = Time.current
    save!

    UserMailer.password_reset(self).deliver_later
  end

  private

  def generate_token
    begin
      self.password_reset_token = SecureRandom.urlsafe_base64
    end while User.exists?(password_reset_token: self.password_reset_token)
  end

  def validate_password?
    !facebook_id && (password.present? || password_confirmation.present?)
  end
end
