class Possession < ActiveRecord::Base
  belongs_to :plan
  has_many :real_estates, :dependent => :destroy
  has_many :vehicles, :dependent => :destroy
  has_many :furnitures, :dependent => :destroy
  has_many :jewelries, :dependent => :destroy
  has_many :artworks, :dependent => :destroy
  has_many :safe_deposit_boxes, :dependent => :destroy
  has_many :in_home_safe_or_vaults, :dependent => :destroy
  has_many :others, :dependent => :destroy
 end
