class User < ApplicationRecord
  # validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP, presence: true
  has_secure_password
  has_secure_password :recovery_password, validations: false
  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { minimum: 6, maximum: 254 }
  validates :name, presence: true
end
