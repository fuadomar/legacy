class CreateSharingRules < ActiveRecord::Migration
  def self.up
    create_table :sharing_rules do |t|
      t.integer :plan_id
      t.integer :relationship_id
      t.string :information_type
      t.string :condition
      t.integer :conditional_parameter

      t.timestamps
    end
  end

  def self.down
    drop_table :sharing_rules
  end
end
