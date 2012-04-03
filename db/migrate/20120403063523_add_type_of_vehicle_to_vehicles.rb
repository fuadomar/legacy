class AddTypeOfVehicleToVehicles < ActiveRecord::Migration
  def self.up
    add_column(:vehicles, :type_of_vehicle, :string)
  end

  def self.down
    remove_column(:vehicles, :type_of_vehicle)
  end
end
