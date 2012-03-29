require 'spec_helper'

describe "bank_accounts/show.html.erb" do
  before(:each) do
    @bank_account = assign(:bank_account, stub_model(BankAccount,
      :financial_account_id => 1,
      :name_of_bank => "Name Of Bank",
      :type_of_account => "Type Of Account",
      :location_of_bank => "Location Of Bank",
      :last_4_digit_of_account => 1,
      :note => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name Of Bank/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Type Of Account/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Location Of Bank/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
