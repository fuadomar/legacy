class AddLocationOfDeedToRealState < ActiveRecord::Migration
  def self.up
    add_column(:real_estates, :location_of_deed, :string)
  end

  def self.down
    remove_column(:real_estates, :location_of_deed)
  end
end
