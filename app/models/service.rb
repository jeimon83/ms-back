# == Schema Information
#
# Table name: services
#
#  id         :bigint           not null, primary key
#  bandwith   :string
#  technology :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Service < ApplicationRecord
end
