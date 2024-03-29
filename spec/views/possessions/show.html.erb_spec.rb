require 'spec_helper'

describe "possessions/show.html.erb" do
  before(:each) do
    @possession = assign(:possession, stub_model(Possession,
      :plan_id => 1,
      :title => "Title"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
  end
end
