require 'spec_helper'

describe "will_and_trusts/show.html.erb" do
  before(:each) do
    @will_and_trust = assign(:will_and_trust, stub_model(WillAndTrust,
      :plan_id => 1,
      :comment => "MyText",
      :file => "File"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/File/)
  end
end
