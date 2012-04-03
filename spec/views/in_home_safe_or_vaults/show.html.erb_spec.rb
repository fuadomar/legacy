require 'spec_helper'

describe "in_home_safe_or_vaults/show.html.erb" do
  before(:each) do
    @in_home_safe_or_vault = assign(:in_home_safe_or_vault, stub_model(InHomeSafeOrVault,
      :possession_id => 1,
      :name => "Name",
      :location => "Location",
      :code => "Code",
      :photo => "Photo",
      :note => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Location/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Code/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Photo/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
