class Application < ApplicationRecord
  belongs_to :user
  belongs_to :dog, optional: true
  serialize :dog_size, Array
  serialize :dog_age, Array
  
  VALID_RESIDENCE_TYPES = ['Rent', 'Own'].freeze
  VALID_ENERGY_LEVELS = ['Low', 'Medium', 'High', 'Very High', 'Flexible'].freeze
  VALID_STATUSES = ['Not Started', 'Pending', 'Pending Dog Selection', 'Submitted', 'Under Review', 'Approved', 'Rejected', 'Cancelled'].freeze

  before_validation :set_default_status, on: :create

  # Validations for any operation
  validates :status, inclusion: { in: VALID_STATUSES }, presence: true
  validates :read_profile, inclusion: { in: [true, false] }, if: :dog_selected?
  validates :residence_type, inclusion: { in: VALID_RESIDENCE_TYPES }, allow_nil: true
  validates :dog_energy_level, inclusion: { in: VALID_ENERGY_LEVELS }, allow_nil: true

  # Custom validations
  validate :felony_details_presence, if: :felony_conviction?
  validate :prohibition_details_presence, if: :pet_prohibition?
  validate :adoption_details_presence, if: :previous_adoption?
  validate :landlord_permission_presence, if: :residence_type_is_rental?
  validate :current_pets_details_presence, if: :current_pets?

  # Validations applied only on update
  validates :address, :occupation, :adoption_reason, :dog_experience, :stimulation_plan, :sleeping_arrangement, :vet_frequency, :dog_age, :dog_size, :dog_medical_conditions, presence: true, on: :update
  validates :current_pets, :felony_conviction, :pet_prohibition, :previous_adoption, :household_children, :household_allergies, :household_agreement, inclusion: { in: [true, false] }, on: :update

    def dog_selected?
    dog_id.present?
  end

  private

  # Custom validation methods
  def felony_details_presence
    errors.add(:felony_details, "can't be blank") if felony_conviction? && felony_details.blank?
  end

  def prohibition_details_presence
    errors.add(:prohibition_details, "can't be blank") if pet_prohibition? && prohibition_details.blank?
  end

  def adoption_details_presence
    errors.add(:adoption_details, "can't be blank") if previous_adoption? && adoption_details.blank?
  end

  def landlord_permission_presence
    errors.add(:landlord_permission, "can't be blank") if residence_type_is_rental? && landlord_permission.nil?
  end

  def current_pets_details_presence
    errors.add(:current_pets_details, "can't be blank") if current_pets? && current_pets_details.blank?
  end

  def residence_type_is_rental?
    residence_type == 'Rent'
  end

  def set_default_status
    self.status ||= 'Pending'
  end
end
