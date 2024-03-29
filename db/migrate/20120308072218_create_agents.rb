class CreateAgents < ActiveRecord::Migration
  def self.up
    create_table :agents do |t|
      t.string :name
      t.string :home_phone
      t.string :cell_phone
      t.text :address
      t.string :city
      t.string :state
      t.integer :zip
      t.string :relationship
      t.references :user

      t.timestamps
    end
  end

  def self.down
    drop_table :agents
  end
end
