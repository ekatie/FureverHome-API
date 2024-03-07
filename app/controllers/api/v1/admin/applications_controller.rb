class Api::V1::Admin::ApplicationsController < ApplicationController
  # Ensure that the user is an admin before allowing them to access the applications
  before_action :authenticate_user!
  before_action :check_admin!

  def index
  end

  def show
  end

  def update
  end
end
