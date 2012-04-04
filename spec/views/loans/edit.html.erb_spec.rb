require 'spec_helper'

describe "loans/edit.html.erb" do
  before(:each) do
    @loan = assign(:loan, stub_model(Loan,
      :financial_account_id => 1,
      :type_of_loan => "MyString",
      :loan_originator => "MyString",
      :current_owner_of_loan => "MyString",
      :contact_information => "MyString",
      :face_value => "MyString",
      :current_debt => "MyString",
      :copy_of_loan => "MyString",
      :note => "MyText"
    ))
  end

  it "renders the edit loan form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => loans_path(@loan), :method => "post" do
      assert_select "input#loan_financial_account_id", :name => "loan[financial_account_id]"
      assert_select "input#loan_type_of_loan", :name => "loan[type_of_loan]"
      assert_select "input#loan_loan_originator", :name => "loan[loan_originator]"
      assert_select "input#loan_current_owner_of_loan", :name => "loan[current_owner_of_loan]"
      assert_select "input#loan_contact_information", :name => "loan[contact_information]"
      assert_select "input#loan_face_value", :name => "loan[face_value]"
      assert_select "input#loan_current_debt", :name => "loan[current_debt]"
      assert_select "input#loan_copy_of_loan", :name => "loan[copy_of_loan]"
      assert_select "textarea#loan_note", :name => "loan[note]"
    end
  end
end
