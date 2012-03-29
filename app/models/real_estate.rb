class RealEstate < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader
  mount_uploader :deed, DocumentUploader
  
  belongs_to :possession

  def self.get_types
    types = Array.new
    types << Array['Primary Home', 'Primary Home']
    types << Array['Vacation Home', 'Vacation Home']
    types << Array['Rental Property', 'Rental Property']
    types << Array['Land', 'Land']
    types << Array['Other', 'Other']
  end
end
