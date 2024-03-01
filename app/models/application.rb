class Application < ApplicationRecord
  belongs_to :user
  belongs_to :dog

  VALID_RESIDENCE_TYPES = ['rent', 'own'].freeze

  validates :status, presence: true
  validates :read_profile, inclusion: { in: [true, false] }
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
  validates :felony_details_presence, if: :felony_conviction?
  validates :prohibition_details_presence, if: :pet_prohibition?
  validates :adoption_details_presence, if: :previous_adoption?
  validates :landlord_permission_presence, if: :residence_type_is_rental?
  validates :current_pets_details_presence, if: :current_pets?

  private

  def felony_details_presence
    errors.add(:felony_details, "can't be blank") if felony_details.blank?
  end

  def prohibition_details_presence
    errors.add(:pet_prohibition_details, "can't be blank") if pet_prohibition_details.blank?
  end

  def adoption_details_presence
    errors.add(:previous_adoption_details, "can't be blank") if previous_adoption_details.blank?
  end

  def landlord_permission_presence
    errors.add(:landlord_permission, "can't be blank") if landlord_permission.blank?
  end

  def current_pets_details_presence
    errors.add(:current_pets_details, "can't be blank") if current_pets_details.blank?
  end

  def residence_type_is_rental?
    residence_type == 'rent'
  end
end
