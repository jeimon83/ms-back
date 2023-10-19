class CreateServices < ActiveRecord::Migration[7.0]
  def change
    create_table :services do |t|
      t.string :technology
      t.string :bandwith

      t.timestamps
    end
  end
end
