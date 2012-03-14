class AddMedicalInstructionIdToAgent < ActiveRecord::Migration
  def self.up
    add_column(:agents, :medical_instruction_id, :integer)
  end

  def self.down
    remove_column(:agents, :medical_instruction_id)
  end
end
