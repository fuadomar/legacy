require 'spec_helper'

describe "insurances/edit.html.erb" do
  before(:each) do
    @insurance = assign(:insurance, stub_model(Insurance,
      :financial_account_id => 1,
      :type_of_insurance => "MyString",
      :insurance_company => "MyString",
      :name_of_agency => "MyString",
      :phone => "MyString",
      :primary_agent => "MyString",
      :value_of_the_policy => "MyString",
      :last_4_digits_of_policy => "MyString",
      :beneficiary => "MyString",
      :copy_of_policy => "MyString",
      :note => "MyText"
    ))
  end

  it "renders the edit insurance form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => insurances_path(@insurance), :method => "post" do
      assert_select "input#insurance_financial_account_id", :name => "insurance[financial_account_id]"
      assert_select "input#insurance_type_of_insurance", :name => "insurance[type_of_insurance]"
      assert_select "input#insurance_insurance_company", :name => "insurance[insurance_company]"
      assert_select "input#insurance_name_of_agency", :name => "insurance[name_of_agency]"
      assert_select "input#insurance_phone", :name => "insurance[phone]"
      assert_select "input#insurance_primary_agent", :name => "insurance[primary_agent]"
      assert_select "input#insurance_value_of_the_policy", :name => "insurance[value_of_the_policy]"
      assert_select "input#insurance_last_4_digits_of_policy", :name => "insurance[last_4_digits_of_policy]"
      assert_select "input#insurance_beneficiary", :name => "insurance[beneficiary]"
      assert_select "input#insurance_copy_of_policy", :name => "insurance[copy_of_policy]"
      assert_select "textarea#insurance_note", :name => "insurance[note]"
    end
  end
end
