require 'spec_helper'

describe "pension_plans/edit.html.erb" do
  before(:each) do
    @pension_plan = assign(:pension_plan, stub_model(PensionPlan,
      :financial_account_id => 1,
      :name => "MyString",
      :administrator => "MyString",
      :administrator_phone => "MyString",
      :primary_contact => "MyString",
      :benefits_for_survivors => "MyString",
      :last_4_digits_of_pension_id => "MyString",
      :beneficiary => "MyString",
      :pension_document => "MyString",
      :note => "MyText"
    ))
  end

  it "renders the edit pension_plan form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => pension_plans_path(@pension_plan), :method => "post" do
      assert_select "input#pension_plan_financial_account_id", :name => "pension_plan[financial_account_id]"
      assert_select "input#pension_plan_name", :name => "pension_plan[name]"
      assert_select "input#pension_plan_administrator", :name => "pension_plan[administrator]"
      assert_select "input#pension_plan_administrator_phone", :name => "pension_plan[administrator_phone]"
      assert_select "input#pension_plan_primary_contact", :name => "pension_plan[primary_contact]"
      assert_select "input#pension_plan_benefits_for_survivors", :name => "pension_plan[benefits_for_survivors]"
      assert_select "input#pension_plan_last_4_digits_of_pension_id", :name => "pension_plan[last_4_digits_of_pension_id]"
      assert_select "input#pension_plan_beneficiary", :name => "pension_plan[beneficiary]"
      assert_select "input#pension_plan_pension_document", :name => "pension_plan[pension_document]"
      assert_select "textarea#pension_plan_note", :name => "pension_plan[note]"
    end
  end
end
