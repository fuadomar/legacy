class CreateContacts < ActiveRecord::Migration
  def self.up
    create_table :contacts do |t|
      t.integer :user_id
      t.string :first_name
      t.string :last_name
      t.date :date_of_birth
      t.string :email
      t.string :phone_number
      t.text :address
      t.text :comments

      t.timestamps
    end
  end

  def self.down
    drop_table :contacts
  end
end
