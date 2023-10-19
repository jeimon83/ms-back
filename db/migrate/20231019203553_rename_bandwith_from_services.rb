class RenameBandwithFromServices < ActiveRecord::Migration[7.0]
  def self.up
    rename_column :services, :bandwith, :bandwidth
  end

  def self.down
    rename_column :services, :bandwidth, :bandwith
  end
end
