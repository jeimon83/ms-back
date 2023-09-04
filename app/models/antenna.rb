class Antenna < ApplicationRecord
  include AASM

  belongs_to :provider


end
