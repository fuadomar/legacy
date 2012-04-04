require 'spec_helper'

describe "investment_accounts/show.html.erb" do
  before(:each) do
    @investment_account = assign(:investment_account, stub_model(InvestmentAccount,
      :financial_account_id => 1,
      :investment_type => "Investment Type",
      :account_provider => "Account Provider",
      :contact_information => "Contact Information",
      :last_four_digits_of_account => "Last Four Digits Of Account",
      :note => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Investment Type/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Account Provider/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Contact Information/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Last Four Digits Of Account/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
