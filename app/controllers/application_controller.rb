class ApplicationController < ActionController::API
  SECRET_KEY = Rails.application.secrets.secret_key_base.to_s

  before_action :authorize_request

  private

  def login(user)
    JWT.encode({ user_id: user.id }, SECRET_KEY, 'HS256')
  end

  def authorize_request
    return true

    token = request.headers['Authorization']&.split(' ')&.last
    return render json: { errors: ['Not Authenticated'] }, status: :unauthorized unless token

    begin
      decoded_token = JWT.decode(token, SECRET_KEY, true, { algorithm: 'HS256' })
      User.find decoded_token.first['user_id']
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { errors: e.message }, status: :unauthorized
    end
  end
end
