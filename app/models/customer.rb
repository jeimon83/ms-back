# == Schema Information
#
# Table name: customers
#
#  id         :bigint           not null, primary key
#  name       :string
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
    if search
      search.downcase!
      search.gsub!(/\w+/, &:capitalize)
      Customer.where("name LIKE ?", "%#{search}%").first
    end
  end

end
