class MedicalInstruction < ActiveRecord::Base
  belongs_to :plan
  has_many :agents, :dependent => :destroy

  LIFE_SUPPORT_ON = 'keep_me_on_life_support'
  LIFE_SUPPORT_OFF = 'do_not_prolong_my_life'

#  attr_accessor :terms_of_service
#  validates_acceptance_of :terms_of_service

  validates :wish, :presence => true

end
