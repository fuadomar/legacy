require 'spec_helper'

describe "safe_deposit_boxes/show.html.erb" do
  before(:each) do
    @safe_deposit_box = assign(:safe_deposit_box, stub_model(SafeDepositBox,
      :possession_id => 1,
      :name_of_bank => "Name Of Bank",
      :street_address => "Street Address",
      :city => "City",
      :state => "State",
      :zip => "Zip",
      :box_number => "Box Number",
      :location_of_key => "Location Of Key",
      :note => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name Of Bank/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Street Address/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/City/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/State/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Zip/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Box Number/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Location Of Key/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
