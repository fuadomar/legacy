require 'spec_helper'

describe "investment_accounts/index.html.erb" do
  before(:each) do
    assign(:investment_accounts, [
      stub_model(InvestmentAccount,
        :financial_account_id => 1,
        :investment_type => "Investment Type",
        :account_provider => "Account Provider",
        :contact_information => "Contact Information",
        :last_four_digits_of_account => "Last Four Digits Of Account",
        :note => "MyText"
      ),
      stub_model(InvestmentAccount,
        :financial_account_id => 1,
        :investment_type => "Investment Type",
        :account_provider => "Account Provider",
        :contact_information => "Contact Information",
        :last_four_digits_of_account => "Last Four Digits Of Account",
        :note => "MyText"
      )
    ])
  end

  it "renders a list of investment_accounts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Investment Type".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Account Provider".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Contact Information".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Last Four Digits Of Account".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
