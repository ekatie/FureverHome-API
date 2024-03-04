class Api::V1::DogsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  
  
  # View a dog's details
  def show
    @dog = Dog.find(params[:id])
    render json: @dog
  end
  
  # View all dogs
  def index
    @dogs = Dog.all
    render json: @dogs
  end
  
  # Toggle dog's favourite status for current user
  def favourite
    @dog = Dog.find(params[:id])
  
    # Check if the dog is already favourited by the user
    if current_user.favourite_dogs.exists?(@dog.id)
      # If yes, remove it from the user's favourites
      current_user.favourite_dogs.delete(@dog)
      message = "Dog removed from favourites"
    else
      # If no, add it to the user's favourites
      current_user.favourite_dogs << @dog
      message = "Dog added to favourites"
    end
  
    # Respond with a message indicating the action performed
    render json: { status: 'success', message: message, dog_id: @dog.id }
  end

  # Admin only
  
  # Add a new dog to the database
  def create
    @dog = Dog.new(dog_params)
    if @dog.save
      render json: @dog, status: :created
    else
      render json: @dog.errors, status: :unprocessable_entity
    end
  end

  # Edit a dog's details
  def update
    @dog = Dog.find(params[:id])
    if @dog.update(dog_params)
      render json: @dog
    else
      render json: @dog.errors, status: :unprocessable_entity
    end
  end

  private

  def dog_params
    params.require(:dog).permit(:name, :age, :sex, :breed, :size, :description, :status, :energy_level, :foster_location, :medical_conditions, :adoption_fee)
  end
end
