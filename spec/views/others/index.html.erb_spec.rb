require 'spec_helper'

describe "others/index.html.erb" do
  before(:each) do
    assign(:others, [
      stub_model(Other,
        :possession_id => 1,
        :name => "Name",
        :photo => "Photo",
        :document => "Document",
        :note => "MyText"
      ),
      stub_model(Other,
        :possession_id => 1,
        :name => "Name",
        :photo => "Photo",
        :document => "Document",
        :note => "MyText"
      )
    ])
  end

  it "renders a list of others" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Photo".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Document".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
