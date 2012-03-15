class SharingRule < ActiveRecord::Base
  belongs_to :plan
  belongs_to :relationship
end
