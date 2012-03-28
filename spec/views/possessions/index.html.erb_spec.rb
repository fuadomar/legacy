require 'spec_helper'

describe "possessions/index.html.erb" do
  before(:each) do
    assign(:possessions, [
      stub_model(Possession,
        :plan_id => 1,
        :title => "Title"
      ),
      stub_model(Possession,
        :plan_id => 1,
        :title => "Title"
      )
    ])
  end

  it "renders a list of possessions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
  end
end
