# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }, on: :create

  before_validation :downcase_email

  def downcase_email
    self.email = email.strip.downcase if email.present?
  end

  DOMAIN = 'mundosatelital.com.ar'.freeze
end
