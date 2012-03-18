class AddPhysicalStatusToUsers < ActiveRecord::Migration
  def self.up
    add_column(:users, :physical_status, :string)
  end

  def self.down
    remove_column(:users, :physical_status)
  end
end
