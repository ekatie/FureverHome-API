class Api::V1::UsersController < ApplicationController
  before_action :authenticate_user!, except: [:create]
  respond_to :json

  def create
    user = User.new(user_params)
    if user.save
      jwt = JwtAuthenticationController.new.generate_token(user.id)
      render json: {jwt: jwt}, status: :created
    else
      render json: {error: user.errors.full_messages}, status: 422
    end
  end

  def update
    if current_user.update(user_params)
      render json: current_user
    else
      render json: { errors: current_user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    @user = User.find(params[:id])
    render json: @user, serializer: UserSerializer
  end

  private

  def user_params
    # List of base attributes
    permitted_attributes = [:name, :email, :phone, :date_of_birth]
    
    # Only add password attributes if they are present in the request (indicating a desire to update the password)
    if params[:user][:password].present? || params[:user][:password_confirmation].present?
      permitted_attributes += [:password, :password_confirmation]
    end
    
    # Permit the session parameter
    # permitted_attributes += [:session]

    params.require(:user).permit(permitted_attributes)
  end
end
