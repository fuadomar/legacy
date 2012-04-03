class Furniture < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader
  mount_uploader :document, DocumentUploader

  belongs_to :possession
end
