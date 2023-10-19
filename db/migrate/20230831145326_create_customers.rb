class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :address
      t.string :contact
      t.string :cuit
      t.string :email
      t.string :name
      t.string :phone

      t.timestamps
    end
  end
end
