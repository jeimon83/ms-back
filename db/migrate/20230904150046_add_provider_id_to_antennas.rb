class AddProviderIdToAntennas < ActiveRecord::Migration[7.0]
  def change
    add_column :antennas, :provider_id, :integer
  end
end
