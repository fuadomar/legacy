class BankAccount < ActiveRecord::Base
  belongs_to :financial_account

  TYPES = [
    ['Checking', 'Checking'],
    ['Savings', 'Savings'],
    ['Money Market', 'Money Market']
  ]
end
