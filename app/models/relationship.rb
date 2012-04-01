class Relationship < ActiveRecord::Base
  mount_uploader :image, ProfileImageUploader
  mount_uploader :doc, DocumentUploader

  attr_accessor :email_verify
  attr_accessible :first_name, :last_name, :relation, :email

  belongs_to :user
  has_many :sharing_rules, :dependent => :destroy

  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :relation, :presence => true
  validates :email, :presence => true


  RELATIONS = [
    ['Brother', 'brother'],
    ['Sister', 'sister'],
    ['Son', 'son'],
    ['Daughter', 'daughter'],
  ]

  def full_name
    return "#{first_name} #{last_name}"
  end
end
