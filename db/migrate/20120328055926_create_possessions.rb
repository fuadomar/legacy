class CreatePossessions < ActiveRecord::Migration
  def self.up
    create_table :possessions do |t|
      t.integer :plan_id
      t.string :title

      t.timestamps
    end
  end

  def self.down
    drop_table :possessions
  end
end
