require 'spec_helper'

describe "financial_accounts/index.html.erb" do
  before(:each) do
    assign(:financial_accounts, [
      stub_model(FinancialAccount,
        :plan_id => 1,
        :title => "Title"
      ),
      stub_model(FinancialAccount,
        :plan_id => 1,
        :title => "Title"
      )
    ])
  end

  it "renders a list of financial_accounts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
  end
end
