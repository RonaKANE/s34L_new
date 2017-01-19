class CreateHosts < ActiveRecord::Migration[5.0]
  def change
    create_table :hosts do |t|
      t.string :hostname
      t.string :serial_number
      t.string :reference_orange
      t.string :location
      t.string :project_name
      t.string :brand
      t.string :model
      t.string :electricity_consumption
      t.text :certificate
      t.boolean :state
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
