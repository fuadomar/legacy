require 'spec_helper'

describe "insurances/index.html.erb" do
  before(:each) do
    assign(:insurances, [
      stub_model(Insurance,
        :financial_account_id => 1,
        :type_of_insurance => "Type Of Insurance",
        :insurance_company => "Insurance Company",
        :name_of_agency => "Name Of Agency",
        :phone => "Phone",
        :primary_agent => "Primary Agent",
        :value_of_the_policy => "Value Of The Policy",
        :last_4_digits_of_policy => "Last 4 Digits Of Policy",
        :beneficiary => "Beneficiary",
        :copy_of_policy => "Copy Of Policy",
        :note => "MyText"
      ),
      stub_model(Insurance,
        :financial_account_id => 1,
        :type_of_insurance => "Type Of Insurance",
        :insurance_company => "Insurance Company",
        :name_of_agency => "Name Of Agency",
        :phone => "Phone",
        :primary_agent => "Primary Agent",
        :value_of_the_policy => "Value Of The Policy",
        :last_4_digits_of_policy => "Last 4 Digits Of Policy",
        :beneficiary => "Beneficiary",
        :copy_of_policy => "Copy Of Policy",
        :note => "MyText"
      )
    ])
  end

  it "renders a list of insurances" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Type Of Insurance".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Insurance Company".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name Of Agency".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Primary Agent".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Value Of The Policy".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Last 4 Digits Of Policy".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Beneficiary".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Copy Of Policy".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
