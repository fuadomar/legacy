class RealEstate < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader
  mount_uploader :deed, DocumentUploader
  
  belongs_to :possession

  TYPES = [
    ['Primary Home', 'Primary Home'],
    ['Vacation Home', 'Vacation Home'],
    ['Rental Property', 'Rental Property'],
    ['Land', 'Land'],
    ['Other', 'Other']
  ]
end
