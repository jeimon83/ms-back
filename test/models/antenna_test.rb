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
require "test_helper"

class AntennaTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
