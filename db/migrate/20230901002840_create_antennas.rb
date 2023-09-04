class CreateAntennas < ActiveRecord::Migration[7.0]
  def change
    create_table :antennas do |t|
      t.string :cpa
      t.string :location
      t.references :customer, null: false, foreign_key: true
      t.references :service, null: false, foreign_key: true
      t.references :provider, null: false, foreign_key: true
      t.boolean :status, default: true

      t.timestamps
    end
  end
end
