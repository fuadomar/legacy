class WillAndTrust < ActiveRecord::Base
  mount_uploader :file, DocumentUploader

  belongs_to :plan
end
