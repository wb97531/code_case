class Coder < ActiveRecord::Base
  has_secure_password

  validates :coder_name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/ }

  has_many :projects, dependent: :destroy
  has_many :snippets, dependent: :destroy
  has_many :courses, dependent: :destroy

  def gravatar_id
    Digest::MD5::hexdigest(email.downcase)
  end

  scope :unverified_phones,  -> { where(phone_verified: false) }

  before_save :set_phone_attributes, if: :phone_verification_needed?
  after_save :send_sms_for_phone_verification, if: :phone_verification_needed?

  def mark_phone_as_verified!
    update!(phone_verified: true, phone_verification_code: nil)
  end

  private

  def set_phone_attributes
    self.phone_verified = false
    self.phone_verification_code = generate_phone_verification_code

    # removes all white spaces, hyphens, and parenthesis
    self.phone.gsub!(/[\s\-\(\)]+/, '')
  end

  def send_sms_for_phone_verification
    PhoneVerificationService.new(user_id: id).process
  end

  def generate_phone_verification_code
    begin
      verification_code = SecureRandom.hex(3)
    end while self.class.exists?(phone_verification_code: verification_code)

    verification_code
  end

  def phone_verification_needed?
    phone.present? && phone_number_changed?
  end
end
