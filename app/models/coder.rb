class Coder < ActiveRecord::Base
  has_secure_password

  validates :coder_name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/ }

  has_many :projects
  has_many :snippets
  has_many :courses

  def gravatar_id
    Digest::MD5::hexdigest(email.downcase)
  end
end
