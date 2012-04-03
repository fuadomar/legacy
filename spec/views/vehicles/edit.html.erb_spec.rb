require 'spec_helper'

describe "vehicles/edit.html.erb" do
  before(:each) do
    @vehicle = assign(:vehicle, stub_model(Vehicle,
      :possession_id => 1,
      :manufacturrer => "MyString",
      :model => "MyString",
      :year => 1,
      :copy_of_title => "MyString",
      :location_of_original_title => "MyString",
      :picture => "MyString",
      :note => "MyText"
    ))
  end

  it "renders the edit vehicle form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => vehicles_path(@vehicle), :method => "post" do
      assert_select "input#vehicle_possession_id", :name => "vehicle[possession_id]"
      assert_select "input#vehicle_manufacturrer", :name => "vehicle[manufacturrer]"
      assert_select "input#vehicle_model", :name => "vehicle[model]"
      assert_select "input#vehicle_year", :name => "vehicle[year]"
      assert_select "input#vehicle_copy_of_title", :name => "vehicle[copy_of_title]"
      assert_select "input#vehicle_location_of_original_title", :name => "vehicle[location_of_original_title]"
      assert_select "input#vehicle_picture", :name => "vehicle[picture]"
      assert_select "textarea#vehicle_note", :name => "vehicle[note]"
    end
  end
end
