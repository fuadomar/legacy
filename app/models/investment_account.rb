class InvestmentAccount < ActiveRecord::Base
  belongs_to :financial_account

  TYPES = [
    ['IRA', 'IRA'],
    ['401K', '401K'],
    ['Brokerage', 'Brokerage'],
    ['Account', 'Account'],
    ['other', 'other']
  ]
end
