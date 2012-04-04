class PensionPlan < ActiveRecord::Base
  mount_uploader :pension_document, DocumentUploader

  belongs_to :financial_account
end
