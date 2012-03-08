class CreateMedicalInstructions < ActiveRecord::Migration
  def self.up
    create_table :medical_instructions do |t|
      t.text :wish
      t.string :incurable_condition_choice
      t.text :incurable_condition_comment
      t.string :irreversible_damage_choice
      t.text :irreversible_damage_comment
      t.string :unable_to_decide_choice
      t.text :unable_to_decide_comment

      t.references :user

      t.timestamps
    end
  end

  def self.down
    drop_table :medical_instructions
  end
end
