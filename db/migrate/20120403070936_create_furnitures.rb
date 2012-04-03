class CreateFurnitures < ActiveRecord::Migration
  def self.up
    create_table :furnitures do |t|
      t.integer :possession_id
      t.string :name
      t.string :photo
      t.string :document
      t.text :note

      t.timestamps
    end
  end

  def self.down
    drop_table :furnitures
  end
end
