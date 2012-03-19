class ExtendAddressFieldOfRelationships < ActiveRecord::Migration
  def self.up
    add_column(:relationships, :city, :string)
    add_column(:relationships, :state, :string)
    add_column(:relationships, :zip_code, :string)
  end

  def self.down
    remove_column(:relationships, :city)
    remove_column(:relationships, :state)
    remove_column(:relationships, :zip_code)
  end
end
