# == Schema Information
#
# Table name: services
#
#  id         :bigint           not null, primary key
#  bandwidth  :string
#  technology :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class ServiceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
