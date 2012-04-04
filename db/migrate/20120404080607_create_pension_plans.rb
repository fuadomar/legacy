class CreatePensionPlans < ActiveRecord::Migration
  def self.up
    create_table :pension_plans do |t|
      t.integer :financial_account_id
      t.string :name
      t.string :administrator
      t.string :administrator_phone
      t.string :primary_contact
      t.string :benefits_for_survivors
      t.string :last_4_digits_of_pension_id
      t.string :beneficiary
      t.string :pension_document
      t.text :note

      t.timestamps
    end
  end

  def self.down
    drop_table :pension_plans
  end
end
