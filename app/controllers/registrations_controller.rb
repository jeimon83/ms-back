class RegistrationsController < ApplicationController
  skip_before_action :authorize_request, only: :create

  def create
    @user = User.new(allowed_params)
    if allowed_params[:email].split('@').last == User::DOMAIN && @user.save
      token = login(@user)
      render json: @user.as_json.merge(token:), status: :created
    elsif allowed_params[:email].split('@').last != User::DOMAIN
      render json: { error: 'Invalid email. Only @mundosatelital emails are allowed' }, status: :unprocessable_entity
    elsif @user.errors.full_messages.include?('Email has already been taken')
      render json: { error: 'Email has already been taken' }, status: :unprocessable_entity
    elsif @user.errors.full_messages.include?('Password is too short (minimum is 6 characters)')
      render json: { error: 'Password is too short (minimum is 6 characters)' }, status: :unprocessable_entity
    else
      render json: { error: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def allowed_params
    params.require(:registration).permit(:email, :password, :password_confirmation)
  end
end
