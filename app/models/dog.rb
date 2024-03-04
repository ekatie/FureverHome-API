class Dog < ApplicationRecord
  VALID_SEXES = ['Male', 'Female'].freeze
  VALID_STATUSES = ['Available', 'Applications Being Reviewed', 'Pending Adoption', 'Adopted'].freeze
  VALID_ENERGY_LEVELS = ['Low', 'Medium', 'High', 'Very High'].freeze
  VALID_GOOD_WITH_VALUES = ['Yes', 'No', 'Sometimes', 'Untested'].freeze

  has_many :dog_images, dependent: :destroy
  has_many :applications, dependent: :destroy
  has_many :users, through: :applications
  

  validates :name, presence: true
  validates :age, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 20.0, message: "must be between 0 and 20.0" }
  validates :sex, presence: true, inclusion: { in: VALID_SEXES }
  validates :breed, presence: true
  validates :size, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0}
  validates :description, presence: true
  validates :status, presence: true, inclusion: { in: VALID_STATUSES }
  validates :energy_level, presence: true, inclusion: { in: VALID_ENERGY_LEVELS }
  validates :good_with_dogs, presence: true, inclusion: { in: VALID_GOOD_WITH_VALUES }
  validates :good_with_cats, presence: true, inclusion: { in: VALID_GOOD_WITH_VALUES }
  validates :good_with_kids, presence: true, inclusion: { in: VALID_GOOD_WITH_VALUES }
  validates :foster_location, presence: true
  validates :medical_conditions, presence: true
  validates :adoption_fee, presence: true, numericality: { greater_than_or_equal_to: 0 }
  
  
  def default_image_url
    dog_images.find_by(is_default: true)&.url
  end

end
