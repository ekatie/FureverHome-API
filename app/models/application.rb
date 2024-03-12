class Application < ApplicationRecord
  belongs_to :user
  belongs_to :dog, optional: true

  before_validation :set_default_status, on: :create

  VALID_RESIDENCE_TYPES = ['Rent', 'Own'].freeze
  VALID_ENERGY_LEVELS = ['Low', 'Medium', 'High', 'Very High', 'Flexible'].freeze

  validates :status, presence: true
  validates :read_profile, inclusion: { in: [true, false] }, if: :dog_selected?
  validates :address, presence: true
  validates :current_pets, inclusion: { in: [true, false] }
  validates :felony_conviction, inclusion: { in: [true, false] }
  validates :pet_prohibition, inclusion: { in: [true, false] }
  validates :previous_adoption, inclusion: { in: [true, false] }
  validates :residence_type, presence: true
  validates :occupation, presence: true
  validates :adoption_reason, presence: true
  validates :dog_experience, presence: true
  validates :stimulation_plan, presence: true
  validates :household_children, inclusion: { in: [true, false] }
  validates :household_allergies, inclusion: { in: [true, false] }
  validates :household_agreement, inclusion: { in: [true, false] }
  validates :sleeping_arrangement, presence: true
  validates :vet_frequency, presence: true
  validates :residence_type, inclusion: { in: VALID_RESIDENCE_TYPES }, presence: true
  validate :felony_details_presence, if: :felony_conviction?
  validate :prohibition_details_presence, if: :pet_prohibition?
  validate :adoption_details_presence, if: :previous_adoption?
  validate :landlord_permission_presence, if: :residence_type_is_rental?
  validate :current_pets_details_presence, if: :current_pets?
  validates :dog_age, presence: true
  validates :dog_size, presence: true
  validates :dog_energy_level, presence: true, inclusion: { in: Dog::VALID_ENERGY_LEVELS }
  validates :dog_medical_conditions, presence: true

  def dog_selected?
    dog_id.present?
  end

  private

  def felony_details_presence
    errors.add(:felony_details, "can't be blank") if felony_details.blank?
  end

  def prohibition_details_presence
    errors.add(:prohibition_details, "can't be blank") if prohibition_details.blank?
  end

  def adoption_details_presence
    errors.add(:adoption_details, "can't be blank") if adoption_details.blank?
  end

  def landlord_permission_presence
    errors.add(:landlord_permission, "can't be blank") if landlord_permission.blank?
  end

  def current_pets_details_presence
    errors.add(:current_pets_details, "can't be blank") if current_pets_details.blank?
  end

  def residence_type_is_rental?
    residence_type == 'Rent'
  end

  def set_default_status
    self.status ||= 'pending'
  end
end
