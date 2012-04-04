require 'spec_helper'

describe "loans/show.html.erb" do
  before(:each) do
    @loan = assign(:loan, stub_model(Loan,
      :financial_account_id => 1,
      :type_of_loan => "Type Of Loan",
      :loan_originator => "Loan Originator",
      :current_owner_of_loan => "Current Owner Of Loan",
      :contact_information => "Contact Information",
      :face_value => "Face Value",
      :current_debt => "Current Debt",
      :copy_of_loan => "Copy Of Loan",
      :note => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Type Of Loan/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Loan Originator/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Current Owner Of Loan/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Contact Information/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Face Value/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Current Debt/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Copy Of Loan/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
