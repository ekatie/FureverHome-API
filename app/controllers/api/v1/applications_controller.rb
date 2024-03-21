class Api::V1::ApplicationsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :cancel, :show, :booking, :matches]
  before_action :check_adopter!, only: [:create, :cancel, :booking, :matches]

  require 'net/http'
  require 'uri'
  require 'base64'
  
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
    application = current_user.applications.new(status: 'Pending')

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
  end
  
  def cancel
    application = current_user.applications.find(params[:id])
  
  if application.update(status: 'Cancelled')
    dog = application.dog
    if dog && dog.applications.where.not(status: 'Cancelled').empty?
      dog.update(status: 'Available')
    end
    render json: application, status: :ok
  else
    render json: { errors: application.errors.full_messages }, status: :unprocessable_entity
  end
  end

  def matches
    application = current_user.applications.find(params[:id])
    available_dogs = Dog.where(status: 'Available')
    matches = MatchCalculator.match(application, available_dogs)

  # Serialize each dog and add the match_percentage
  serialized_matches = matches.map do |match|
    serialized_dog = ActiveModelSerializers::SerializableResource.new(
      match[:dog],
      serializer: DogSerializer,
      scope: current_user
    ).as_json
    serialized_dog.merge(match_percentage: match[:match_percentage])
  end

  render json: serialized_matches, status: :ok
  rescue ActiveRecord::RecordNotFound
  render json: { error: 'Application not found' }, status: :not_found
end

# Fetch event details from Calendly
def fetch_calendly_event_details(uuid)
  uri = URI.parse("https://api.calendly.com/scheduled_events/#{uuid}")

  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true

  request = Net::HTTP::Get.new(uri.request_uri)
  request["Authorization"] = "Bearer #{ENV['CALENDLY_PERSONAL_ACCESS_TOKEN']}"

  response = http.request(request)

  if response.code == "200"
    JSON.parse(response.body)
  else
    Rails.logger.error "Failed to fetch Calendly event details. Response code: #{response.code}, Body: #{response.body}"
    nil
  end
end

# Update application with Calendly event details
def booking
  application_id = params[:id]
  event_uri = params[:event_uri]
  application = current_user.applications.find(application_id)

  # Extract UUID from event URI
  uuid = event_uri.split('/').last

  # User personal access token to fetch event details
  event_details = fetch_calendly_event_details(uuid)

  if event_details && event_details["resource"]
    start_time_str = event_details["resource"]["start_time"]
    unless start_time_str.nil?
      start_time = DateTime.parse(start_time_str)

   # Update the application based on its current status
   case application.status
   when "Pending Interview Booking"
    application.update(interview_date: start_time, status: 'Interview Booked')
   when "Pending Meet and Greet Booking"
    application.update(meet_greet_date: start_time, status: 'Meet and Greet Booked')
   when "Pending Adoption Date Booking"
    application.update(adoption_date: start_time, status: 'Adoption Date Booked')
   else
    # Log or handle unexpected application status
    Rails.logger.info "Unexpected application status: #{application.status}"
   end
  end
 end
end

  private

  def application_params
    params.require(:application).permit(:status, :read_profile, :address, :current_pets, :current_pets_details, :felony_conviction, :felony_details, :pet_prohibition, :prohibition_details, :previous_adoption, :adoption_details, :residence_type, :landlord_permission, :occupation, :adoption_reason, :dog_experience, :stimulation_plan, :household_children, :household_allergies, :household_agreement, :sleeping_arrangement, :vet_frequency, {dog_age: []}, {dog_size: []}, :dog_energy_level, :dog_medical_conditions, :dog_id, :interview_date, :meet_greet_date, :adoption_date)
  end

end