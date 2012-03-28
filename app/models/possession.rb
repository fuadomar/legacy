class Possession < ActiveRecord::Base
  belongs_to :plan
  has_many :real_estates


  REAL_ESTATE = 'real_estate'
end
