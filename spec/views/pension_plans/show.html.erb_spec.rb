require 'spec_helper'

describe "pension_plans/show.html.erb" do
  before(:each) do
    @pension_plan = assign(:pension_plan, stub_model(PensionPlan,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Administrator/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Administrator Phone/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Primary Contact/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Benefits For Survivors/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Last 4 Digits Of Pension/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Beneficiary/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Pension Document/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
