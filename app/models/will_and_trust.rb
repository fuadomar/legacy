class WillAndTrust < ActiveRecord::Base
  mount_uploader :file, WillDocumentUploader

  belongs_to :plan
end
