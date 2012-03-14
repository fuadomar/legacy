class RemoveUserIdFromAgent < ActiveRecord::Migration
  def self.up
    remove_column(:agents, :user_id)
  end

  def self.down
    add_column(:agents, :user_id, :integer)
  end
end
