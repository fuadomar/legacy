require 'spec_helper'

describe "will_and_trusts/index.html.erb" do
  before(:each) do
    assign(:will_and_trusts, [
      stub_model(WillAndTrust,
        :plan_id => 1,
        :comment => "MyText",
        :file => "File"
      ),
      stub_model(WillAndTrust,
        :plan_id => 1,
        :comment => "MyText",
        :file => "File"
      )
    ])
  end

  it "renders a list of will_and_trusts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "File".to_s, :count => 2
  end
end
