class CreateMemorials < ActiveRecord::Migration
  def self.up
    create_table :memorials do |t|
      t.integer :plan_id
      t.string :organizer_name
      t.text :organizer_preferences
      t.text :prepared_services
      t.text :service_preferences
      t.text :remains
      t.text :additional_notes

      t.timestamps
    end
  end

  def self.down
    drop_table :memorials
  end
end
