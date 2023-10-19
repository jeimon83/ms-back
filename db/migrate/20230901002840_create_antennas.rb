class CreateAntennas < ActiveRecord::Migration[7.0]
  def change
    create_table :antennas do |t|
      t.string :cpa
      t.string :location
      t.references :customer, null: false, foreign_key: true
      t.string :service
      t.boolean :state, default: 'pending'

      t.timestamps
    end
  end
end
