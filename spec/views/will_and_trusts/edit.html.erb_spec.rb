require 'spec_helper'

describe "will_and_trusts/edit.html.erb" do
  before(:each) do
    @will_and_trust = assign(:will_and_trust, stub_model(WillAndTrust,
      :plan_id => 1,
      :comment => "MyText",
      :file => "MyString"
    ))
  end

  it "renders the edit will_and_trust form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => will_and_trusts_path(@will_and_trust), :method => "post" do
      assert_select "input#will_and_trust_plan_id", :name => "will_and_trust[plan_id]"
      assert_select "textarea#will_and_trust_comment", :name => "will_and_trust[comment]"
      assert_select "input#will_and_trust_file", :name => "will_and_trust[file]"
    end
  end
end
