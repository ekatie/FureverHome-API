class User < ApplicationRecord
  # Devise modules
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User

  # Associations
  has_many :applications, dependent: :destroy
  has_many :dogs, through: :applications
  has_and_belongs_to_many :favourite_dogs, class_name: 'Dog', join_table: 'favourite_dogs_users'

  # Enums
  enum user_type: { adopter: 'adopter', admin: 'admin' }

  # Validations
  validates :name, presence: true, length: { maximum: 100 }
  validates :phone, presence: true, format: { with: /\A[0-9]+\z/ }, length: { maximum: 15 }

end
