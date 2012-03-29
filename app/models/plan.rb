class Plan < ActiveRecord::Base
  belongs_to :user
  has_many :medical_instructions
  has_many :memorials
  has_many :sharing_rules
  has_many :possessions
  has_many :financial_accounts
  has_many :will_and_trusts

  validates :title, :presence => true

  INFORMATION_TYPE_MEDICAL = 'medical_directive'
  INFORMATION_TYPE_MEMORIAL = 'memorial'
  INFORMATION_TYPE_MY_THINGS = 'my_things'
  INFORMATION_TYPE_TRUST = 'will_trust'
  INFORMATION_TYPE_FINANCIAL = 'financial_accounts'
  INFORMATION_TYPE_GUARDIANSHIP = 'guardianship'


  def is_show_plan_link(plan_type, user_id)
    relationship_id = Relationship.where(:login_user_id => user_id)
    return self.sharing_rules.where(:relationship_id => relationship_id, :information_type => plan_type).present?
  end
end
