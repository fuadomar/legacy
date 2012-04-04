class CreateInvestmentAccounts < ActiveRecord::Migration
  def self.up
    create_table :investment_accounts do |t|
      t.integer :financial_account_id
      t.string :investment_type
      t.string :account_provider
      t.string :contact_information
      t.string :last_four_digits_of_account
      t.text :note

      t.timestamps
    end
  end

  def self.down
    drop_table :investment_accounts
  end
end
