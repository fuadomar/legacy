class AddLoginUserIdToRelationships < ActiveRecord::Migration
  def self.up
    add_column(:relationships, :login_user_id, :integer)
  end

  def self.down
    remove_column(:relationships, :login_user_id)
  end
end
