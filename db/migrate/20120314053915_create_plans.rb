class CreatePlans < ActiveRecord::Migration
  def self.up
    create_table :plans do |t|
      t.string :title
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :plans
  end
end
