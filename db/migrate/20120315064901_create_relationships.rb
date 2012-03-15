class CreateRelationships < ActiveRecord::Migration
  def self.up
    create_table :relationships do |t|
      t.integer :user_id
      t.string :type
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.date :date_of_birth
      t.text :address
      t.string :phone_number
      t.string :email
      t.string :image
      t.string :doc
      t.string :relation
      t.text :additional_notes

      t.timestamps
    end
  end

  def self.down
    drop_table :relationships
  end
end
