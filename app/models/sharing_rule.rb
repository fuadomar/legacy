class SharingRule < ActiveRecord::Base
  belongs_to :plan
  belongs_to :relationship

  CONDITION_NOW = 'share_now'
  CONDITION_HOSPITALIZED = 'hospitalized'
  CONDITION_OWNER_TURN = 'owner_turn'
  CONDITION_VIEWER_TURN = 'viewer_turn'
end
