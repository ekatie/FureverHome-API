class Api::V1::Admin::DashboardController < ApplicationController
  # Ensure that the user is an admin before allowing them to access the admin dashboard
  before_action :authenticate_user!
  before_action :check_admin!

  def index
  end
end
