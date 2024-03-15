class Api::V1::DogsController < ApplicationController
  before_action :set_current_user, only: [:index, :show]
  before_action :authenticate_user!, except: [:index, :show]
    
  # View a dog's details
  def show
    @dog = Dog.find(params[:id])
    render json: @dog, scope: @current_user
  end
  
  # View all dogs
  def index
    @dogs = Dog.available
    render json: @dogs, each_serializer: DogSerializer, scope: @current_user
  end
  
  # Toggle dog's favourite status for current user
  def favourite
    @dog = Dog.find(params[:id])
  
    # Check if the dog is already favourited by the user
    if @current_user.favourite_dogs.exists?(@dog.id)
      # If yes, remove it from the user's favourites
      @current_user.favourite_dogs.delete(@dog)
      is_favourite = false
      message = "Dog removed from favourites"
    else
      # If no, add it to the user's favourites
      @current_user.favourite_dogs << @dog
      is_favourite = true
      message = "Dog added to favourites"
    end
  
    # Respond with a message indicating the action performed
    render json: { status: 'success', message: message, dog_id: @dog.id, is_favourite: is_favourite}
  end

  private

  def dog_params
    params.require(:dog).permit(:name, :age, :sex, :breed, :size, :description, :status, :energy_level, :foster_location, :medical_conditions, :adoption_fee, :good_with_cats, :good_with_dogs, :good_with_kids, :social_media_link)
  end
end
