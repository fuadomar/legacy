require 'spec_helper'

describe "safe_deposit_boxes/index.html.erb" do
  before(:each) do
    assign(:safe_deposit_boxes, [
      stub_model(SafeDepositBox,
        :possession_id => 1,
        :name_of_bank => "Name Of Bank",
        :street_address => "Street Address",
        :city => "City",
        :state => "State",
        :zip => "Zip",
        :box_number => "Box Number",
        :location_of_key => "Location Of Key",
        :note => "MyText"
      ),
      stub_model(SafeDepositBox,
        :possession_id => 1,
        :name_of_bank => "Name Of Bank",
        :street_address => "Street Address",
        :city => "City",
        :state => "State",
        :zip => "Zip",
        :box_number => "Box Number",
        :location_of_key => "Location Of Key",
        :note => "MyText"
      )
    ])
  end

  it "renders a list of safe_deposit_boxes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name Of Bank".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Street Address".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "City".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "State".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Zip".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Box Number".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Location Of Key".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
