class Api::V1::ApplicationsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :cancel, :show, :select_match, :schedule_interview, :schedule_virtual_meet_greet, :schedule_adoption_day, :matches]
  before_action :check_adopter!, only: [:create, :cancel, :select_match, :schedule_interview, :schedule_virtual_meet_greet, :schedule_adoption_day, :matches]

  def new
  end

  def show
    application = current_user.applications.first
    if application
      render json: application, each_serializer: ApplicationSerializer, status: :ok
    else
      render json: { error: 'Application not found' }, status: :not_found
    end
  end

  def create
    application = current_user.applications.new(status: 'pending')

    if application.save
      render json: application, status: :created
    else
      Rails.logger.debug application.errors.full_messages.join(", ")
      render json: { errors: application.errors.full_messages }, status: :unprocessable_entity
    end
  end

def update
    application = current_user.applications.find(params[:id])
    if application.update(application_params)
      render json: application, status: :ok
    else
      Rails.logger.debug application.errors.full_messages.join(", ")
      render json: { errors: application.errors.full_messages }, status: :unprocessable_entity
    end
end

  def index
    # applications = current_user.applications
    # if applications.present?
    #   render json: applications, each_serializer: ApplicationSerializer, status: :ok
    # else
    #   render json: { error: 'No applications found' }, status: :not_found
    # end
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
    params.require(:application).permit(:status, :read_profile, :address, :current_pets, :current_pets_details, :felony_conviction, :felony_details, :pet_prohibition, :prohibition_details, :previous_adoption, :adoption_details, :residence_type, :landlord_permission, :occupation, :adoption_reason, :dog_experience, :stimulation_plan, :household_children, :household_allergies, :household_agreement, :sleeping_arrangement, :vet_frequency, {dog_age: []}, {dog_size: []}, :dog_energy_level, :dog_medical_conditions)
  end

end
