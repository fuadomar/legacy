require 'spec_helper'

describe "credit_cards/show.html.erb" do
  before(:each) do
    @credit_card = assign(:credit_card, stub_model(CreditCard,
      :financial_account_id => 1,
      :card_type => "Card Type",
      :issuer => "Issuer",
      :phone => "Phone",
      :last_four_digits_of_card => "Last Four Digits Of Card",
      :note => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Card Type/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Issuer/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Phone/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Last Four Digits Of Card/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
