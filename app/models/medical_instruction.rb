class MedicalInstruction < ActiveRecord::Base
  belongs_to :user

  LIFE_SUPPORT_ON = 'keep_me_on_life_support'
  LIFE_SUPPORT_OFF = 'do_not_prolong_my_life'
end
