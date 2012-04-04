require 'spec_helper'

describe "debit_cards/new.html.erb" do
  before(:each) do
    assign(:debit_card, stub_model(DebitCard,
      :financial_account_id => 1,
      :card_type => "MyString",
      :issuer => "MyString",
      :phone => "MyString",
      :last_four_digits_of_card => "MyString",
      :note => "MyText"
    ).as_new_record)
  end

  it "renders new debit_card form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => debit_cards_path, :method => "post" do
      assert_select "input#debit_card_financial_account_id", :name => "debit_card[financial_account_id]"
      assert_select "input#debit_card_card_type", :name => "debit_card[card_type]"
      assert_select "input#debit_card_issuer", :name => "debit_card[issuer]"
      assert_select "input#debit_card_phone", :name => "debit_card[phone]"
      assert_select "input#debit_card_last_four_digits_of_card", :name => "debit_card[last_four_digits_of_card]"
      assert_select "textarea#debit_card_note", :name => "debit_card[note]"
    end
  end
end
