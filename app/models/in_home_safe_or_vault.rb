class InHomeSafeOrVault < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader
  
  belongs_to :possession
end
