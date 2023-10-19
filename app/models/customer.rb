# == Schema Information
#
# Table name: customers
#
#  id         :bigint           not null, primary key
#  address    :string
#  contact    :string
#  cuit       :string
#  email      :string
#  name       :string
#  phone      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Customer < ApplicationRecord
  has_many :antennas

  validates :name, presence: true
  validates :cuit, presence: true, uniqueness: true
  validates :phone, presence: true
  validates :email, presence: true, uniqueness: true
  validates :address, presence: true
  validates :contact, presence: true

  def self.search(search)
    return unless search

    search.downcase!
    search.gsub!(/\w+/, &:capitalize)
    Customer.where('name LIKE ?', "%#{search}%").first
  end
end
