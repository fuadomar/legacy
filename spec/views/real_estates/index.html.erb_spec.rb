require 'spec_helper'

describe "real_estates/index.html.erb" do
  before(:each) do
    assign(:real_estates, [
      stub_model(RealEstate,
        :possession_id => 1,
        :real_estate_type => "Real Estate Type",
        :address => "Address",
        :city => "City",
        :state => "State",
        :deed => "Deed",
        :photo => "Photo",
        :note => "MyText"
      ),
      stub_model(RealEstate,
        :possession_id => 1,
        :real_estate_type => "Real Estate Type",
        :address => "Address",
        :city => "City",
        :state => "State",
        :deed => "Deed",
        :photo => "Photo",
        :note => "MyText"
      )
    ])
  end

  it "renders a list of real_estates" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Real Estate Type".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "City".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "State".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Deed".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Photo".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
