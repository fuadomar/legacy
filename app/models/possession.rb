class Possession < ActiveRecord::Base
  belongs_to :plan
  has_many :real_estates
  has_many :vehicles
  has_many :furnitures
  has_many :jewelries
  has_many :artworks
 end
