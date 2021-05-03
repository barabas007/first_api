class User < ApplicationRecord
  has_secure_password
  validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP, presence: true
  validates :password, presence: true, length: { minimum: 6, maximum: 254 }
  validates :name, presence: true
end
