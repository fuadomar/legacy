class Plan < ActiveRecord::Base
  belongs_to :user
  has_many :medical_instructions
  has_many :memorials
  has_many :sharing_rules

  validates :title, :presence => true

  INFORMATION_TYPE_MEDICAL = 'medical_directive'
  INFORMATION_TYPE_MEMORIAL = 'memorial'
  INFORMATION_TYPE_MY_THINGS = 'my_things'
  INFORMATION_TYPE_TRUST = 'will_trust'
  INFORMATION_TYPE_FINANCIAL = 'financial_accounts'
  INFORMATION_TYPE_GUARDIANSHIP = 'guardianship'
end
