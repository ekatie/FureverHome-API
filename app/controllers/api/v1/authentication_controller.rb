class Api::V1::AuthenticationController < ApplicationController
  def login
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      token = JwtAuthenticationController.new.generate_token(user.id)
      render json: { user: UserSerializer.new(user).as_json, token: token }, status: :ok
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end

  def validate_token
    token = params[:token] || request.headers['Authorization']&.split(' ')&.last
    decoded_token = JwtAuthenticationController.new.verify_token(token)
    if decoded_token
      render json: { valid: true, user_id: decoded_token['user_id'] }, status: :ok
    else
      render json: { valid: false }, status: :unauthorized
    end
  rescue JWT::ExpiredSignature
    # Handle expired token
    render json: { valid: false, error: "Token has expired" }, status: :unauthorized
  rescue JWT::DecodeError => e
    # Handle other errors, such as invalid token
    render json: { valid: false, error: e.message }, status: :unauthorized
  end
  
end