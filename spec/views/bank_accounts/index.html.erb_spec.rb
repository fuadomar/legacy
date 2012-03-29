require 'spec_helper'

describe "bank_accounts/index.html.erb" do
  before(:each) do
    assign(:bank_accounts, [
      stub_model(BankAccount,
        :financial_account_id => 1,
        :name_of_bank => "Name Of Bank",
        :type_of_account => "Type Of Account",
        :location_of_bank => "Location Of Bank",
        :last_4_digit_of_account => 1,
        :note => "MyText"
      ),
      stub_model(BankAccount,
        :financial_account_id => 1,
        :name_of_bank => "Name Of Bank",
        :type_of_account => "Type Of Account",
        :location_of_bank => "Location Of Bank",
        :last_4_digit_of_account => 1,
        :note => "MyText"
      )
    ])
  end

  it "renders a list of bank_accounts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name Of Bank".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Type Of Account".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Location Of Bank".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
