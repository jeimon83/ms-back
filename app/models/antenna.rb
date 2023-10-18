# == Schema Information
#
# Table name: antennas
#
#  id          :bigint           not null, primary key
#  cpa         :string
#  location    :string
#  status      :boolean          default(TRUE)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  customer_id :bigint           not null
#  service_id  :bigint           not null
#
# Indexes
#
#  index_antennas_on_customer_id  (customer_id)
#  index_antennas_on_service_id   (service_id)
#
# Foreign Keys
#
#  fk_rails_...  (customer_id => customers.id)
#  fk_rails_...  (service_id => services.id)
#
class Antenna < ApplicationRecord
  include AASM

  belongs_to :customer

  aasm column: 'state' do
    state :pending, initial: true
    state :installed
    state :active
    state :inactive

    event :install do
      transitions from: :pending, to: :installed
    end

    event :activate do
      transitions from: %i[pending installed], to: :active
    end

    event :deactivate do
      transitions from: :active, to: :inactive
    end
  end
end
