class CreateBankAccounts < ActiveRecord::Migration
  def self.up
    create_table :bank_accounts do |t|
      t.integer :financial_account_id
      t.string :name_of_bank
      t.string :type_of_account
      t.string :location_of_bank
      t.integer :last_4_digit_of_account
      t.text :note

      t.timestamps
    end
  end

  def self.down
    drop_table :bank_accounts
  end
end
