class Vehicle < ActiveRecord::Base
  mount_uploader :copy_of_title, DocumentUploader
  mount_uploader :picture, PhotoUploader
  
  belongs_to :possession

  TYPES = [
    ['Car', 'Car'],
    ['Truck', 'Truck'],
    ['Boat', 'Boat'],
    ['Motorcycle', 'Motorcycle'],
    ['Other', 'Other']
  ]
end
