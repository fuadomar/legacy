class CreateFinancialAccounts < ActiveRecord::Migration
  def self.up
    create_table :financial_accounts do |t|
      t.integer :plan_id
      t.string :title

      t.timestamps
    end
  end

  def self.down
    drop_table :financial_accounts
  end
end
