class AddPlanIdToMedicalInstruction < ActiveRecord::Migration
  def self.up
    add_column(:medical_instructions, :plan_id, :integer)
  end

  def self.down
    remove_column(:medical_instructions, :plan_id)
  end
end
