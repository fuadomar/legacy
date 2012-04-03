class CreateInHomeSafeOrVaults < ActiveRecord::Migration
  def self.up
    create_table :in_home_safe_or_vaults do |t|
      t.integer :possession_id
      t.string :name
      t.string :location
      t.string :code
      t.string :photo
      t.text :note

      t.timestamps
    end
  end

  def self.down
    drop_table :in_home_safe_or_vaults
  end
end
