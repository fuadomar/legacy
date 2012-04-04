require 'spec_helper'

describe "credit_cards/index.html.erb" do
  before(:each) do
    assign(:credit_cards, [
      stub_model(CreditCard,
        :financial_account_id => 1,
        :card_type => "Card Type",
        :issuer => "Issuer",
        :phone => "Phone",
        :last_four_digits_of_card => "Last Four Digits Of Card",
        :note => "MyText"
      ),
      stub_model(CreditCard,
        :financial_account_id => 1,
        :card_type => "Card Type",
        :issuer => "Issuer",
        :phone => "Phone",
        :last_four_digits_of_card => "Last Four Digits Of Card",
        :note => "MyText"
      )
    ])
  end

  it "renders a list of credit_cards" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Card Type".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Issuer".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Last Four Digits Of Card".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
