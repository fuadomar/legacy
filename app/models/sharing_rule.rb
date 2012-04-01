class SharingRule < ActiveRecord::Base
  belongs_to :plan
  belongs_to :relationship

  validate :when_i_turn_age_present

  def when_i_turn_age_present
    if (when_i_turn.present? && when_i_turn_age.blank?)
      errors.add(:when_i_turn, "Must provide Age, If you select When I Turn Option")
    end
  end
  
end
