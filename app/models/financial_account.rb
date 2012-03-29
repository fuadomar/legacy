class FinancialAccount < ActiveRecord::Base
  belongs_to :plan
  has_many :bank_accounts


  BANK_ACCOUNT = 'bank_account'
end
