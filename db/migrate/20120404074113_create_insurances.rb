class CreateInsurances < ActiveRecord::Migration
  def self.up
    create_table :insurances do |t|
      t.integer :financial_account_id
      t.string :type_of_insurance
      t.string :insurance_company
      t.string :name_of_agency
      t.string :phone
      t.string :primary_agent
      t.string :value_of_the_policy
      t.string :last_4_digits_of_policy
      t.string :beneficiary
      t.string :copy_of_policy
      t.text :note

      t.timestamps
    end
  end

  def self.down
    drop_table :insurances
  end
end
