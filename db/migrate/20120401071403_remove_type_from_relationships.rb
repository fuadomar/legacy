class RemoveTypeFromRelationships < ActiveRecord::Migration
  def self.up
    remove_column(:relationships, :type)
  end

  def self.down
    add_column(:relationships, :type, :string)
  end
end
