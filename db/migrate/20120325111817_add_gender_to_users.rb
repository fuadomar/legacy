class AddGenderToUsers < ActiveRecord::Migration
  def self.up
    add_column(:users, :gender, :string)
  end

  def self.down
    remove_column(:musers, :gender)
  end
end
