class AddUserIdToAgents < ActiveRecord::Migration
  def self.up
    add_column :agents, :user_id, :integer
  end

  def self.down
    remove_column :agents, :user_id
  end
end
