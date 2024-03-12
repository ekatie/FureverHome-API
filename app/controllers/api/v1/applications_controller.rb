class Api::V1::ApplicationsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :cancel, :select_match, :schedule_interview, :schedule_virtual_meet_greet, :schedule_adoption_day, :matches]
  before_action :check_adopter!, only: [:create, :cancel, :select_match, :schedule_interview, :schedule_virtual_meet_greet, :schedule_adoption_day, :matches]

  def new
  end

  def create
    application = @current_user.applications.new(application_params)
    if application.save
      render json: application, status: :created
    else
      Rails.logger.debug application.errors.full_messages.join(", ")
      render json: { errors: application.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
  end

  def index
  end

  def cancel
  end

  def select_match
  end

  def schedule_interview
  end

  def schedule_virtual_meet_greet
  end

  def schedule_adoption_day
  end

  def matches
  end

  private

  def application_params
    params.require(:application).permit(:read_profile, :address, :current_pets, :current_pets_details, :felony_conviction, :felony_details, :pet_prohibition, :prohibition_details, :previous_adoption, :adoption_details, :residence_type, :landlord_permission, :occupation, :adoption_reason, :dog_experience, :stimulation_plan, :household_children, :household_allergies, :household_agreement, :sleeping_arrangement, :vet_frequency, {dog_age: []}, {dog_size: []}, :dog_energy_level, :dog_medical_conditions)
  end

end
