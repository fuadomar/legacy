class CreateSafeDepositBoxes < ActiveRecord::Migration
  def self.up
    create_table :safe_deposit_boxes do |t|
      t.integer :possession_id
      t.string :name_of_bank
      t.string :street_address
      t.string :city
      t.string :state
      t.string :zip
      t.string :box_number
      t.string :location_of_key
      t.text :note

      t.timestamps
    end
  end

  def self.down
    drop_table :safe_deposit_boxes
  end
end
