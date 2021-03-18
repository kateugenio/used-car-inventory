class CreateVehicles < ActiveRecord::Migration[6.0]
  def change
    create_table :vehicles do |t|
      t.string :make
      t.string :model
      t.string :location
      t.string :condition
      t.decimal :initial_price
      t.decimal :current_price
      t.integer :year
      t.integer :mileage

      t.timestamps
    end
  end
end
