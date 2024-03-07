class ApplicationController < ActionController::API

def check_admin!
  unless current_user.admin?
    render json: { error: 'You are not authorized to perform this action' }, status: :forbidden
  end
end
end
