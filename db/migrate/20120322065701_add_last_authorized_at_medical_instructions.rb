class AddLastAuthorizedAtMedicalInstructions < ActiveRecord::Migration
  def self.up
    add_column(:medical_instructions, :authorized_at, :datetime)
  end

  def self.down
    remove_column(:medical_instructions, :authorized_at)
  end
end
