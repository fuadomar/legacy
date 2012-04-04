class Insurance < ActiveRecord::Base
  mount_uploader :copy_of_policy, DocumentUploader

  belongs_to :financial_account

  TYPES = [
    ['Life', 'Life'],
    ['Home', 'Home'],
    ['Car', 'Car'],
    ['Travel', 'Travel'],
    ['Disability', 'Disability'],
    ['Renters', 'Renters']
  ]
end
