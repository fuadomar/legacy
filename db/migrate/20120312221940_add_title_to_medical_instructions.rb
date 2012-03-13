class AddTitleToMedicalInstructions < ActiveRecord::Migration
  def self.up
    add_column(:medical_instructions, :title, :string)
    add_column(:medical_instructions, :first_name, :string)
    add_column(:medical_instructions, :last_name, :string)
    add_column(:medical_instructions, :relationship, :string)
    add_column(:medical_instructions, :creator_id, :integer)
  end

  def self.down
    remove_column(:medical_instructions, :title)
    remove_column(:medical_instructions, :first_name)
    remove_column(:medical_instructions, :last_name)
    remove_column(:medical_instructions, :relation)
    remove_column(:medical_instructions, :creator_id)
  end
end
