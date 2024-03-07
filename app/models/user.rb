class User < ApplicationRecord
  # Modules
  has_secure_password

  # Associations
  has_many :applications, dependent: :destroy
  has_many :dogs, through: :applications
  has_and_belongs_to_many :favourite_dogs, class_name: 'Dog', join_table: 'favourite_dogs_users'

  # Enums
  enum user_type: { adopter: 'adopter', admin: 'admin' }

  # Validations
  validates :name, presence: true, length: { maximum: 100 }
  validates :phone, presence: true, format: { with: /\A\d{3}-\d{3}-\d{4}\z/}, length: { is: 12 }
  validates :date_of_birth, presence: true

end
