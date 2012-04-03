class CreateVehicles < ActiveRecord::Migration
  def self.up
    create_table :vehicles do |t|
      t.integer :possession_id
      t.string :manufacturrer
      t.string :model
      t.integer :year
      t.string :copy_of_title
      t.string :location_of_original_title
      t.string :picture
      t.text :note

      t.timestamps
    end
  end

  def self.down
    drop_table :vehicles
  end
end
