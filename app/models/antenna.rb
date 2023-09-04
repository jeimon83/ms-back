class Antenna < ApplicationRecord
  include AASM

  belongs_to :provider

  aasm do
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
