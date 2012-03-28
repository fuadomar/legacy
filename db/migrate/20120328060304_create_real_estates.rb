class CreateRealEstates < ActiveRecord::Migration
  def self.up
    create_table :real_estates do |t|
      t.integer :possession_id
      t.string :real_estate_type
      t.string :address
      t.string :city
      t.string :state
      t.string :deed
      t.string :photo
      t.text :note

      t.timestamps
    end
  end

  def self.down
    drop_table :real_estates
  end
end
