require 'spec_helper'

describe "insurances/show.html.erb" do
  before(:each) do
    @insurance = assign(:insurance, stub_model(Insurance,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Type Of Insurance/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Insurance Company/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name Of Agency/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Phone/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Primary Agent/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Value Of The Policy/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Last 4 Digits Of Policy/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Beneficiary/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Copy Of Policy/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
