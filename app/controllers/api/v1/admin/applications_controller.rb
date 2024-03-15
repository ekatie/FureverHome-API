class Api::V1::Admin::ApplicationsController < ApplicationController
  # Ensure that the user is an admin before allowing them to access the applications
  before_action :authenticate_user!
  before_action :check_admin!

  def index
    @applications = Application.all
    render json: @applications, each_serializer: ApplicationSerializer, status: :ok
  end

  def show
    @application = Application.find(params[:id])
    render json: @application, serializer: ApplicationSerializer, status: :ok
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Application not found' }, status: :not_found
  end

  def update
    @application = Application.find(params[:id])
    if @application.update(application_params)
      render json: @application, serializer: ApplicationSerializer, status: :ok
    else
      render json: { errors: application.errors.full_messages }, status: :unprocessable_entity
    end
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Application not found' }, status: :not_found
  end

  private

  def application_params
    params.require(:application).permit(:status)
  end
  
end
