class Loan < ActiveRecord::Base
  mount_uploader :copy_of_loan, DocumentUploader

  belongs_to :financial_account

  TYPES = [
    ['Mortgage', 'Mortgage'],
    ['Car', 'Car'],
    ['Student', 'Student'],
    ['Business', 'SavBusinessings'],
    ['Home Equity', 'Home Equity'],
    ['other', 'other']
  ]
end
