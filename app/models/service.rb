# == Schema Information
#
# Table name: services
#
#  id           :bigint           not null, primary key
#  service_type :string
#  velocity     :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Service < ApplicationRecord
end
