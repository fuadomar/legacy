class BankAccount < ActiveRecord::Base
  belongs_to :financial_account

  def self.get_types
    types = Array.new
    types << Array['Checking', 'Checking']
    types << Array['Savings', 'Savings']
    types << Array['Money Market', 'Money Market']
  end
end
