require 'spec_helper'

describe "will_and_trusts/new.html.erb" do
  before(:each) do
    assign(:will_and_trust, stub_model(WillAndTrust,
      :plan_id => 1,
      :comment => "MyText",
      :file => "MyString"
    ).as_new_record)
  end

  it "renders new will_and_trust form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => will_and_trusts_path, :method => "post" do
      assert_select "input#will_and_trust_plan_id", :name => "will_and_trust[plan_id]"
      assert_select "textarea#will_and_trust_comment", :name => "will_and_trust[comment]"
      assert_select "input#will_and_trust_file", :name => "will_and_trust[file]"
    end
  end
end
