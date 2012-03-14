class RemoveUserIdAndTitleFromMedicalInstruction < ActiveRecord::Migration
  def self.up
    remove_column(:medical_instructions, :user_id)
    remove_column(:medical_instructions, :title)
  end

  def self.down
    add_column(:medical_instructions, :user_id, :integer)
    add_column(:medical_instructions, :title, :string)
  end
end
