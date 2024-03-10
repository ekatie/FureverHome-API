class JwtAuthenticationController < ApplicationController
  def generate_token(user_id)
    payload = { 
      user_id: user_id,
      exp: 24.hours.from_now.to_i,
      user_type: User.find(user_id).user_type
    }
    JWT.encode(payload, Rails.application.secrets.secret_key_base)
  end

  def verify_token(token)
    JWT.decode(token, Rails.application.secrets.secret_key_base, true, algorithm: 'HS256').first
  rescue JWT::DecodeError => e
    Rails.logger.warn "JWT Decode Error: #{e.message}"
    nil
  end
end
