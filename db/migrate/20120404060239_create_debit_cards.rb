class CreateDebitCards < ActiveRecord::Migration
  def self.up
    create_table :debit_cards do |t|
      t.integer :financial_account_id
      t.string :card_type
      t.string :issuer
      t.string :phone
      t.string :last_four_digits_of_card
      t.text :note

      t.timestamps
    end
  end

  def self.down
    drop_table :debit_cards
  end
end
