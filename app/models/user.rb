class User < ApplicationRecord
  # validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP, presence: true
  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { minimum: 6, maximum: 254 }
  validates :name, presence: true
end
