class Api::V1::Admin::DogsController < ApplicationController
  # Ensure that the user is an admin before allowing them to access the applications
  before_action :authenticate_user!
  before_action :check_admin!

  def index
    @dogs = Dog.all
    render json: @dogs, each_serializer: DogSerializer
  end

  def show
    @dog = Dog.find(params[:id])
    render json: @dog, serializer: DogSerializer, status: :ok
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Dog not found' }, status: :not_found
  end

  def create
    @dog = Dog.new(dog_params)
    if @dog.save
      render json: @dog, serializer: DogSerializer, status: :created
    else
      render json: { errors: @dog.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @dog = Dog.find(params[:id])
    if @dog.update(dog_params)
      render json: @dog, serializer: DogSerializer, status: :ok
    else
      render json: { errors: @dog.errors.full_messages }, status: :unprocessable_entity
    end
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Dog not found' }, status: :not_found
  end

  private

  def dog_params
    params.require(:dog).permit(:name, :age, :sex, :breed, :size, :description, :status, :energy_level, :foster_location, :medical_conditions, :adoption_fee, :good_with_cats, :good_with_dogs, :good_with_kids, :social_media_link)
  end
end
