class AddNameAndAddressToUsers < ActiveRecord::Migration
  def self.up
    add_column(:users, :name, :string)
    add_column(:users, :date_of_birth, :date)
    add_column(:users, :address, :string)
  end

  def self.down
    remove_column(:users, :name)
    remove_column(:users, :date_of_birth)
    remove_column(:users, :address)
  end
end
