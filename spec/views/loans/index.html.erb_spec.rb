require 'spec_helper'

describe "loans/index.html.erb" do
  before(:each) do
    assign(:loans, [
      stub_model(Loan,
        :financial_account_id => 1,
        :type_of_loan => "Type Of Loan",
        :loan_originator => "Loan Originator",
        :current_owner_of_loan => "Current Owner Of Loan",
        :contact_information => "Contact Information",
        :face_value => "Face Value",
        :current_debt => "Current Debt",
        :copy_of_loan => "Copy Of Loan",
        :note => "MyText"
      ),
      stub_model(Loan,
        :financial_account_id => 1,
        :type_of_loan => "Type Of Loan",
        :loan_originator => "Loan Originator",
        :current_owner_of_loan => "Current Owner Of Loan",
        :contact_information => "Contact Information",
        :face_value => "Face Value",
        :current_debt => "Current Debt",
        :copy_of_loan => "Copy Of Loan",
        :note => "MyText"
      )
    ])
  end

  it "renders a list of loans" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Type Of Loan".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Loan Originator".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Current Owner Of Loan".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Contact Information".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Face Value".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Current Debt".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Copy Of Loan".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
