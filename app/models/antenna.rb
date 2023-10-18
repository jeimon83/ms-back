# == Schema Information
#
# Table name: antennas
#
#  id          :bigint           not null, primary key
#  cpa         :string
#  location    :string
#  service     :string
#  state       :string           default("pending")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  customer_id :bigint           not null
#
# Indexes
#
#  index_antennas_on_customer_id  (customer_id)
#
# Foreign Keys
#
#  fk_rails_...  (customer_id => customers.id)
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
      transitions from: [:pending, :installed], to: :active
    end

    event :deactivate do
      transitions from: :active, to: :inactive
    end
  end
end
