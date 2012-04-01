class RefractorSharingRules < ActiveRecord::Migration
  def self.up
    remove_column(:sharing_rules, :information_type)
    remove_column(:sharing_rules, :condition)
    remove_column(:sharing_rules, :conditional_parameter)

    add_column(:sharing_rules, :allow_financials, :boolean, :default => false)
    add_column(:sharing_rules, :allow_possessions, :boolean, :default => false)
    add_column(:sharing_rules, :allow_will_and_trusts, :boolean, :default => false)
    add_column(:sharing_rules, :allow_medical_instructions, :boolean, :default => false)
    add_column(:sharing_rules, :allow_memorials, :boolean, :default => false)
    add_column(:sharing_rules, :when_i_turn, :boolean, :default => false)
    add_column(:sharing_rules, :when_i_turn_age, :integer)
    add_column(:sharing_rules, :when_incapacitated, :boolean, :default => false)
    add_column(:sharing_rules, :when_die, :boolean, :default => false)
    add_column(:sharing_rules, :allow_notify, :boolean, :default => false)
  end

  def self.down
    add_column(:sharing_rules, :information_type, :string)
    add_column(:sharing_rules, :condition, :string)
    add_column(:sharing_rules, :conditional_parameter, :integer)

    remove_column(:sharing_rules, :allow_financials)
    remove_column(:sharing_rules, :allow_possessions)
    remove_column(:sharing_rules, :allow_will_and_trusts)
    remove_column(:sharing_rules, :allow_medical_instructions)
    remove_column(:sharing_rules, :allow_memorials)
    remove_column(:sharing_rules, :when_i_turn)
    remove_column(:sharing_rules, :when_i_turn_age)
    remove_column(:sharing_rules, :when_incapacitated)
    remove_column(:sharing_rules, :when_die)
    remove_column(:sharing_rules, :allow_notify)
  end
end
