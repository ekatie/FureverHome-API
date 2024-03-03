class Api::V1::Admin::UsersController < ApplicationController
  # Ensure that the user is an admin before allowing them to access the users
  before_action :authenticate_admin!

  def index
  end

  def show
  end

  def update
  end
end
