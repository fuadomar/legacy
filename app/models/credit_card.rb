class CreditCard < ActiveRecord::Base
  belongs_to :financial_account

  TYPES = [
    ['Visa', 'Visa'],
    ['MasterCard', 'MasterCard'],
    ['American Express', 'American Express'],
    ['other', 'other']
  ]
end
