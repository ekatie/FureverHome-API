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
  
  after_save :manage_default_image

  def is_favourite(user)
    user && user.favourite_dogs.exists?(self.id)
  end

  # def dog_images_attributes=(attributes)
  #   # Track IDs of incoming images
  #   incoming_ids = attributes.filter_map { |a| a[:id] unless a[:_destroy] == '1' }.compact
  
  #   # Destroy images that are not in the incoming IDs and are already associated
  #   dog_images.where.not(id: incoming_ids).destroy_all
  
  #   attributes.each do |image_attributes|
  #     if image_attributes[:id].present?
  #       # Find and update existing image
  #       existing_image = dog_images.find_by(id: image_attributes[:id])
  #       if image_attributes[:_destroy] == '1'
  #         existing_image&.destroy
  #       else
  #         existing_image&.update(image_attributes.slice(:url, :is_default))
  #       end
  #     elsif image_attributes[:_destroy] != '1'
  #       # Create new image unless it's marked for destruction
  #       dog_images.build(image_attributes.slice(:url, :is_default))
  #     end
  #   end
  
  #   manage_default_image
  # end
  
  def dog_images_attributes=(attributes)
    # Filter out any attributes marked for destruction or without an id (new images)
    existing_image_ids = attributes.reject { |attr| attr['_destroy'] == '1' || attr['id'].blank? }.map { |attr| attr['id'].to_i }
  
    # Delete images that are not in the list of existing image ids or are marked for destruction
    dog_images.where.not(id: existing_image_ids).or(dog_images.where(id: attributes.select { |attr| attr['_destroy'] == '1' }.map { |attr| attr['id'].to_i })).destroy_all
  
    attributes.each do |image_attributes|
      if image_attributes['id'].present? && image_attributes['_destroy'] != '1'
        # Update existing images
        existing_image = dog_images.find_by(id: image_attributes['id'].to_i)
        existing_image.update(image_attributes.except('id', '_destroy')) if existing_image
      elsif image_attributes['_destroy'] != '1'
        # Add new images
        dog_images.build(image_attributes.except('_destroy'))
      end
    end
  
  end
  

  # private
  
  def manage_default_image
    # If multiple images are set as default, keep the latest marked as default
    default_images = dog_images.select(&:is_default)
    if default_images.size > 1
      # Sort by updated_at to keep the latest as default
      sorted_by_update = default_images.reject { |image| image.updated_at.nil? }.sort_by(&:updated_at)
      # Unset all but the latest
      sorted_by_update[0...-1].each { |image| image.update(is_default: false) }
    end
  end  
  
end