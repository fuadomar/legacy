class CreateLoans < ActiveRecord::Migration
  def self.up
    create_table :loans do |t|
      t.integer :financial_account_id
      t.string :type_of_loan
      t.string :loan_originator
      t.string :current_owner_of_loan
      t.string :contact_information
      t.string :face_value
      t.string :current_debt
      t.string :copy_of_loan
      t.text :note

      t.timestamps
    end
  end

  def self.down
    drop_table :loans
  end
end
