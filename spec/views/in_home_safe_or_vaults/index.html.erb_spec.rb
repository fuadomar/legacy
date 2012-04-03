require 'spec_helper'

describe "in_home_safe_or_vaults/index.html.erb" do
  before(:each) do
    assign(:in_home_safe_or_vaults, [
      stub_model(InHomeSafeOrVault,
        :possession_id => 1,
        :name => "Name",
        :location => "Location",
        :code => "Code",
        :photo => "Photo",
        :note => "MyText"
      ),
      stub_model(InHomeSafeOrVault,
        :possession_id => 1,
        :name => "Name",
        :location => "Location",
        :code => "Code",
        :photo => "Photo",
        :note => "MyText"
      )
    ])
  end

  it "renders a list of in_home_safe_or_vaults" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Location".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Code".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Photo".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
