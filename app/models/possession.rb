class Possession < ActiveRecord::Base
  belongs_to :plan
  has_many :real_estates
  has_many :vehicles
  has_many :furnitures
  has_many :jewelries
  has_many :artworks
  has_many :safe_deposit_boxes
  has_many :in_home_safe_or_vaults
  has_many :others
 end
