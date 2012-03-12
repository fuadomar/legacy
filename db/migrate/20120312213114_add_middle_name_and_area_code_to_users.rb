class AddMiddleNameAndAreaCodeToUsers < ActiveRecord::Migration
  def self.up
    add_column(:users, :middle_name, :string)
    add_column(:users, :area_code_part1, :string)
    add_column(:users, :area_code_part2, :string)
    add_column(:users, :area_code_part3, :string)
  end

  def self.down
    remove_column(:users, :middle_name)
    remove_column(:users, :area_code_part1)
    remove_column(:users, :area_code_part2)
    remove_column(:users, :area_code_part3)
  end
end
