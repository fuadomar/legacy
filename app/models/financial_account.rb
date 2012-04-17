class FinancialAccount < ActiveRecord::Base
  belongs_to :plan
  has_many :bank_accounts, :dependent => :destroy
  has_many :investment_accounts, :dependent => :destroy
  has_many :credit_cards, :dependent => :destroy
  has_many :debit_cards, :dependent => :destroy
  has_many :loans, :dependent => :destroy
  has_many :insurances, :dependent => :destroy
  has_many :pension_plans, :dependent => :destroy
end
