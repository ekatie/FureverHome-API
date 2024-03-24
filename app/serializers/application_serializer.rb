class ApplicationSerializer < ActiveModel::Serializer
  attributes :id, :status, :created_at, :updated_at, :occupation, :address,
   :residence_type, :landlord_permission, :current_pets, :current_pets_details, :felony_conviction, :felony_details,  :pet_prohibition, :prohibition_details, :previous_adoption,  :adoption_details, :adoption_reason, :dog_experience, :stimulation_plan, :sleeping_arrangement, :vet_frequency, :household_children, :household_allergies, :household_agreement, :dog_age, :dog_size, :dog_energy_level, :dog_medical_conditions, :user_id, :dog_id, :interview_date, :meet_greet_date, :adoption_date, :is_contract_signed, :is_fee_paid

  belongs_to :user
  belongs_to :dog, optional: true, if: :include_dog?

  def include_dog?
    object.dog_id.present?
  end
end