class Dog < ApplicationRecord
  VALID_SEXES = ['Male', 'Female'].freeze
  VALID_STATUSES = ['Available', 'Applications Being Reviewed', 'Pending Adoption', 'Adopted'].freeze
  VALID_ENERGY_LEVELS = ['Low', 'Medium', 'High', 'Very High'].freeze
  VALID_GOOD_WITH_VALUES = ['yes', 'no', 'sometimes', 'untested'].freeze

  has_many :dog_images, dependent: :destroy
  has_many :applications, dependent: :destroy
  has_many :users, through: :applications

  validates :name, presence: true
  validates :age, presence: true
  validates :sex, presence: true, inclusion: { in: VALID_SEXES }
  validates :breed, presence: true
  validates :size, presence: true
  validates :description, presence: true
  validates :status, presence: true, inclusion: { in: VALID_STATUSES }
  validates :energy_level, presence: true, inclusion: { in: VALID_ENERGY_LEVELS }
  validates :good_with_dogs, presence: true, inclusion: { in: VALID_GOOD_WITH_VALUES }
  validates :good_with_cats, presence: true, inclusion: { in: VALID_GOOD_WITH_VALUES }
  validates :good_with_kids, presence: true, inclusion: { in: VALID_GOOD_WITH_VALUES }
  validates :foster_location, presence: true
  validates :medical_conditions, presence: true
  validates :adoption_fee, presence: true, numericality: { greater_than_or_equal_to: 0 }
  
end
