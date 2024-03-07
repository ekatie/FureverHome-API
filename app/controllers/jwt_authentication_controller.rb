class JwtAuthenticationController < ApplicationController
  def generate_token(user_id)
    payload = { user_id: user_id }
    JWT.encode(payload, Rails.application.secrets.secret_key_base)
  end

  def verify_token(token)
    JWT.decode(token, Rails.application.secrets.secret_key_base).first
  rescue JWT::DecodeError
    nil
  end
end
