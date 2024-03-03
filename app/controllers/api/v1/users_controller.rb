class Api::V1::UsersController < ApplicationController
  before_action :authenticate_user!, except: [:create]
  respond_to :json

  def create
    user = User.new(user_params)
    if user.save
      jwt = Auth.issue({user: user.id})
      render json: {jwt: jwt}
    else
      render json: {error: user.errors.full_messages}, status: 422
    end
  end

  def update
  end

  def show
    @user = User.find(params[:id])
    render json: @user, serializer: UserSerializer
  end
end
