require 'spec_helper'

describe "bank_accounts/new.html.erb" do
  before(:each) do
    assign(:bank_account, stub_model(BankAccount,
      :financial_account_id => 1,
      :name_of_bank => "MyString",
      :type_of_account => "MyString",
      :location_of_bank => "MyString",
      :last_4_digit_of_account => 1,
      :note => "MyText"
    ).as_new_record)
  end

  it "renders new bank_account form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => bank_accounts_path, :method => "post" do
      assert_select "input#bank_account_financial_account_id", :name => "bank_account[financial_account_id]"
      assert_select "input#bank_account_name_of_bank", :name => "bank_account[name_of_bank]"
      assert_select "input#bank_account_type_of_account", :name => "bank_account[type_of_account]"
      assert_select "input#bank_account_location_of_bank", :name => "bank_account[location_of_bank]"
      assert_select "input#bank_account_last_4_digit_of_account", :name => "bank_account[last_4_digit_of_account]"
      assert_select "textarea#bank_account_note", :name => "bank_account[note]"
    end
  end
end
