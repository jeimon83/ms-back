class SessionsController < ApplicationController
  skip_before_action :authorize_request, only: :create

  def create
    @user = User.find_by_email session_params[:email]

    if @user&.authenticate session_params[:password]
      token = login(@user)
      render json: @user.as_json.merge(token:), status: :ok
    elsif session_params[:email].blank?
      render json: { errors: 'Missing email' }, status: :unauthorized
    elsif session_params[:password].blank?
      render json: { errors: 'Missing password' }, status: :unauthorized
    elsif session_params[:email].split('@').last != User::DOMAIN
      render json: { errors: 'Wrong domain' }, status: :unauthorized
    elsif @user.nil?
      render json: { errors: 'User does not exist' }, status: :unauthorized
    elsif @user&.authenticate(session_params[:password]) == false
      render json: { errors: 'Wrong password' }, status: :unauthorized
    else
      render json: { errors: 'Ops! There was an error. Please try again' }, status: :unauthorized
    end
  end

  private

  def session_params
    @session_params ||= params.require(:session).permit(:email, :password)
  end
end
