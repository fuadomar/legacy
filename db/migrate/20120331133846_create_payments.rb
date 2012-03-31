class CreatePayments < ActiveRecord::Migration
  def self.up
    create_table :payments do |t|
      t.integer :user_id
      t.string :subscription_type
      t.boolean :subscribed, :default => false
      t.string :transaction_number
      t.string :last_4_digits
      t.string :stripe_id

      t.timestamps
    end
  end

  def self.down
    drop_table :payments
  end
end
