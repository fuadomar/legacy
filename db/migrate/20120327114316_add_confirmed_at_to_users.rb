class AddConfirmedAtToUsers < ActiveRecord::Migration
  def self.up
    change_table(:users) do |t|
     t.confirmable
    end
  end

  def self.down
    remove_column :users, :confirmable
  end
end
