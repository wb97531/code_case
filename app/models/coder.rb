class Coder < ActiveRecord::Base
  has_secure_password

  validates :coder_name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/ }
  validates :password, length: { in: 6..70 }

  has_many :projects, dependent: :destroy
  has_many :snippets, dependent: :destroy
  has_many :courses, dependent: :destroy

  def gravatar_id
    Digest::MD5::hexdigest(email.downcase)
  end

  def needs_verification!
    self.update_attributes!(
      token: SecureRandom.urlsafe_base64,
      verified_email: false
    )
    CoderVerifyNotifier.signed_up(self).deliver
  end
end
