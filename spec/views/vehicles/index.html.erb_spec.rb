require 'spec_helper'

describe "vehicles/index.html.erb" do
  before(:each) do
    assign(:vehicles, [
      stub_model(Vehicle,
        :possession_id => 1,
        :manufacturrer => "Manufacturrer",
        :model => "Model",
        :year => 1,
        :copy_of_title => "Copy Of Title",
        :location_of_original_title => "Location Of Original Title",
        :picture => "Picture",
        :note => "MyText"
      ),
      stub_model(Vehicle,
        :possession_id => 1,
        :manufacturrer => "Manufacturrer",
        :model => "Model",
        :year => 1,
        :copy_of_title => "Copy Of Title",
        :location_of_original_title => "Location Of Original Title",
        :picture => "Picture",
        :note => "MyText"
      )
    ])
  end

  it "renders a list of vehicles" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Manufacturrer".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Model".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Copy Of Title".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Location Of Original Title".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Picture".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
