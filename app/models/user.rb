class User < ApplicationRecord
  has_secure_password

  has_many :applications, dependent: :destroy
  has_many :dogs, through: :applications

  enum user_type: { adopter: 0, admin: 1 }

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :name, presence: true, length: { maximum: 100 }
  validates :phone, presence: true, format: { with: /\A[0-9]+\z/ }, length: { maximum: 15 }

end
