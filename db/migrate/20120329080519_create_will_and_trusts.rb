class CreateWillAndTrusts < ActiveRecord::Migration
  def self.up
    create_table :will_and_trusts do |t|
      t.integer :plan_id
      t.text :comment
      t.string :file

      t.timestamps
    end
  end

  def self.down
    drop_table :will_and_trusts
  end
end
