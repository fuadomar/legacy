require 'spec_helper'

describe "vehicles/show.html.erb" do
  before(:each) do
    @vehicle = assign(:vehicle, stub_model(Vehicle,
      :possession_id => 1,
      :manufacturrer => "Manufacturrer",
      :model => "Model",
      :year => 1,
      :copy_of_title => "Copy Of Title",
      :location_of_original_title => "Location Of Original Title",
      :picture => "Picture",
      :note => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Manufacturrer/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Model/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Copy Of Title/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Location Of Original Title/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Picture/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
