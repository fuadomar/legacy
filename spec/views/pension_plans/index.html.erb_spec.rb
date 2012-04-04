require 'spec_helper'

describe "pension_plans/index.html.erb" do
  before(:each) do
    assign(:pension_plans, [
      stub_model(PensionPlan,
        :financial_account_id => 1,
        :name => "Name",
        :administrator => "Administrator",
        :administrator_phone => "Administrator Phone",
        :primary_contact => "Primary Contact",
        :benefits_for_survivors => "Benefits For Survivors",
        :last_4_digits_of_pension_id => "Last 4 Digits Of Pension",
        :beneficiary => "Beneficiary",
        :pension_document => "Pension Document",
        :note => "MyText"
      ),
      stub_model(PensionPlan,
        :financial_account_id => 1,
        :name => "Name",
        :administrator => "Administrator",
        :administrator_phone => "Administrator Phone",
        :primary_contact => "Primary Contact",
        :benefits_for_survivors => "Benefits For Survivors",
        :last_4_digits_of_pension_id => "Last 4 Digits Of Pension",
        :beneficiary => "Beneficiary",
        :pension_document => "Pension Document",
        :note => "MyText"
      )
    ])
  end

  it "renders a list of pension_plans" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Administrator".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Administrator Phone".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Primary Contact".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Benefits For Survivors".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Last 4 Digits Of Pension".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Beneficiary".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Pension Document".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
