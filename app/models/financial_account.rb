class FinancialAccount < ActiveRecord::Base
  belongs_to :plan
  has_many :bank_accounts
  has_many :investment_accounts
  has_many :credit_cards
  has_many :debit_cards
  has_many :loans
  has_many :insurances
  has_many :pension_plans
end
