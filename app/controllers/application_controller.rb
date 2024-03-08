class ApplicationController < ActionController::API

  def index
  end


  private

    def check_adopter!
      unless current_user.adopter?
        render json: { error: 'Only adopters can perform this action' }, status: :forbidden
      end
    end

    def authenticate_user!
      token = request.headers['Authorization']&.split(' ')&.last
      Rails.logger.info "Received Token: #{token}"
      decoded_token = JwtAuthenticationController.new.verify_token(token)
      Rails.logger.info "Decoded Token: #{decoded_token}"
      @current_user = User.find(decoded_token['user_id']) if decoded_token
      Rails.logger.info "Current User: #{@current_user}"


      token = request.headers['Authorization']&.split(' ')&.last
      decoded_token = JwtAuthenticationController.new.verify_token(token)
      @current_user = User.find(decoded_token['user_id']) if decoded_token
      render json: { error: 'Unauthorized' }, status: :unauthorized unless @current_user
    end

    def check_admin!
      unless current_user.admin?
        render json: { error: 'You are not authorized to perform this action' }, status: :forbidden
      end
    end
end
