class AddAgreementFieldToMedicalInstructions < ActiveRecord::Migration
  def self.up
    add_column(:medical_instructions, :instructions_agreement, :boolean)
    add_column(:medical_instructions, :requirements_agreement, :boolean)
  end

  def self.down
    remove_column(:medical_instructions, :instructions_agreement)
    remove_column(:medical_instructions, :requirements_agreement)
  end
end
