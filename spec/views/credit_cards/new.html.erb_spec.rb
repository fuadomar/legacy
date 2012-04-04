require 'spec_helper'

describe "credit_cards/new.html.erb" do
  before(:each) do
    assign(:credit_card, stub_model(CreditCard,
      :financial_account_id => 1,
      :card_type => "MyString",
      :issuer => "MyString",
      :phone => "MyString",
      :last_four_digits_of_card => "MyString",
      :note => "MyText"
    ).as_new_record)
  end

  it "renders new credit_card form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => credit_cards_path, :method => "post" do
      assert_select "input#credit_card_financial_account_id", :name => "credit_card[financial_account_id]"
      assert_select "input#credit_card_card_type", :name => "credit_card[card_type]"
      assert_select "input#credit_card_issuer", :name => "credit_card[issuer]"
      assert_select "input#credit_card_phone", :name => "credit_card[phone]"
      assert_select "input#credit_card_last_four_digits_of_card", :name => "credit_card[last_four_digits_of_card]"
      assert_select "textarea#credit_card_note", :name => "credit_card[note]"
    end
  end
end
