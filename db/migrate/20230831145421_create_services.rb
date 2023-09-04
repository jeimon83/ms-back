class CreateServices < ActiveRecord::Migration[7.0]
  def change
    create_table :services do |t|
      t.string :service_type
      t.string :velocity

      t.timestamps
    end
  end
end
