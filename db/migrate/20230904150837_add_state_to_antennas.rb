class AddStateToAntennas < ActiveRecord::Migration[7.0]
  def change
    add_column :antennas, :state, :string
  end
end
