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
require "test_helper"

class AntennaTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
