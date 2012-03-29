require 'spec_helper'

describe "financial_accounts/new.html.erb" do
  before(:each) do
    assign(:financial_account, stub_model(FinancialAccount,
      :plan_id => 1,
      :title => "MyString"
    ).as_new_record)
  end

  it "renders new financial_account form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => financial_accounts_path, :method => "post" do
      assert_select "input#financial_account_plan_id", :name => "financial_account[plan_id]"
      assert_select "input#financial_account_title", :name => "financial_account[title]"
    end
  end
end
