class Dog < ApplicationRecord
  # Constants
  VALID_SEXES = ['Male', 'Female'].freeze
  VALID_STATUSES = ['Available', 'Applications Being Reviewed', 'Pending Adoption', 'Adopted'].freeze
  VALID_ENERGY_LEVELS = ['Low', 'Medium', 'High', 'Very High', 'Flexible'].freeze
  VALID_GOOD_WITH_VALUES = ['Yes', 'No', 'Sometimes', 'Untested'].freeze

  # Associations
  has_many :dog_images, dependent: :destroy
  accepts_nested_attributes_for :dog_images, allow_destroy: true
  has_many :applications, dependent: :destroy
  has_many :users, through: :applications
    has_many :favourites, dependent: :destroy
  has_many :favourited_by_users, through: :favourites, source: :user

  # Scopes
  scope :available, -> { where(status: 'Available') }

  # Validations
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

  def is_favourite(user)
    user && user.favourite_dogs.exists?(self.id)
  end

  def dog_images_attributes=(attributes)
    puts "Received attributes: #{attributes.inspect}"
    # Handle new images or updates to existing images
    attributes.each do |image_attributes|
      puts "Current image_attributes: #{image_attributes.inspect}"
      next if image_attributes[:_destroy] == '1' && image_attributes[:id].blank? # Skip if marked for destruction without an ID
  
      if image_attributes[:id].present?
        # Update existing image
        existing_image = dog_images.find(image_attributes[:id])
        next if image_attributes[:_destroy] == '1' # Destroy marked image
        existing_image.update(is_default: image_attributes[:is_default], url: image_attributes[:url])
      else
        # Create new image unless it's marked for destruction
        next if image_attributes[:_destroy] == '1'
        dog_images.build(url: image_attributes[:url], is_default: image_attributes[:is_default])
      end
    end
  
    manage_default_image
  end
  
  private
  
  def manage_default_image
    # If multiple images are set as default, keep the latest marked as default
    default_images = dog_images.select(&:is_default)
    if default_images.size > 1
      # Sort by updated_at to keep the latest as default
      sorted_by_update = default_images.sort_by(&:updated_at)
      # Unset all but the latest
      sorted_by_update[0...-1].each { |image| image.update(is_default: false) }
    end
  end
  
end
