class Relationship < ActiveRecord::Base
  mount_uploader :image, ProfileImageUploader
  mount_uploader :doc, DocumentUploader

  belongs_to :user
  has_many :sharing_rules
end
