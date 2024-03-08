class User < ApplicationRecord
  # Modules
  has_secure_password

  # Associations
  has_many :applications, dependent: :destroy
  has_many :dogs, through: :applications
  has_many :favourites, dependent: :destroy
  has_many :favourite_dogs, through: :favourites, source: :dog

  # Enums
  enum user_type: { adopter: 'adopter', admin: 'admin' }

  # Validations
  validates :name, presence: true, length: { maximum: 100 }
  validates :phone, presence: true, format: { with: /\A\d{3}-\d{3}-\d{4}\z/}, length: { is: 12 }
  validates :date_of_birth, presence: true

end
