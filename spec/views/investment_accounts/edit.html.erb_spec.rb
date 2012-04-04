require 'spec_helper'

describe "investment_accounts/edit.html.erb" do
  before(:each) do
    @investment_account = assign(:investment_account, stub_model(InvestmentAccount,
      :financial_account_id => 1,
      :investment_type => "MyString",
      :account_provider => "MyString",
      :contact_information => "MyString",
      :last_four_digits_of_account => "MyString",
      :note => "MyText"
    ))
  end

  it "renders the edit investment_account form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => investment_accounts_path(@investment_account), :method => "post" do
      assert_select "input#investment_account_financial_account_id", :name => "investment_account[financial_account_id]"
      assert_select "input#investment_account_investment_type", :name => "investment_account[investment_type]"
      assert_select "input#investment_account_account_provider", :name => "investment_account[account_provider]"
      assert_select "input#investment_account_contact_information", :name => "investment_account[contact_information]"
      assert_select "input#investment_account_last_four_digits_of_account", :name => "investment_account[last_four_digits_of_account]"
      assert_select "textarea#investment_account_note", :name => "investment_account[note]"
    end
  end
end
