class ApplicationSerializer < ActiveModel::Serializer
  attributes :id, :status, :created_at, :updated_at, :occupation, :address,
             :residence_type, :landlord_permission, :current_pets,
             :current_pets_details, :felony_conviction, :felony_details,
             :pet_prohibition, :prohibition_details, :previous_adoption,
             :adoption_details, :adoption_reason, :dog_experience,
             :stimulation_plan, :sleeping_arrangement, :vet_frequency,
             :household_children, :household_allergies, :household_agreement,
             :dog_age, :dog_size, :dog_energy_level, :dog_medical_conditions,
             :user_id, :dog_id

  # # Optional: If you want to include associated user or dog details
  # belongs_to :user, if: :include_user?
  # belongs_to :dog, optional: true, if: :include_dog?

  # def include_user?
  #   # Logic to determine if user details should be included
  #   object.user_id.present?
  # end

  # def include_dog?
  #   # Logic to determine if dog details should be included
  #   object.dog_id.present?
  # end
end
