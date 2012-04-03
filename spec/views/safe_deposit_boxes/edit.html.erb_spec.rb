require 'spec_helper'

describe "safe_deposit_boxes/edit.html.erb" do
  before(:each) do
    @safe_deposit_box = assign(:safe_deposit_box, stub_model(SafeDepositBox,
      :possession_id => 1,
      :name_of_bank => "MyString",
      :street_address => "MyString",
      :city => "MyString",
      :state => "MyString",
      :zip => "MyString",
      :box_number => "MyString",
      :location_of_key => "MyString",
      :note => "MyText"
    ))
  end

  it "renders the edit safe_deposit_box form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => safe_deposit_boxes_path(@safe_deposit_box), :method => "post" do
      assert_select "input#safe_deposit_box_possession_id", :name => "safe_deposit_box[possession_id]"
      assert_select "input#safe_deposit_box_name_of_bank", :name => "safe_deposit_box[name_of_bank]"
      assert_select "input#safe_deposit_box_street_address", :name => "safe_deposit_box[street_address]"
      assert_select "input#safe_deposit_box_city", :name => "safe_deposit_box[city]"
      assert_select "input#safe_deposit_box_state", :name => "safe_deposit_box[state]"
      assert_select "input#safe_deposit_box_zip", :name => "safe_deposit_box[zip]"
      assert_select "input#safe_deposit_box_box_number", :name => "safe_deposit_box[box_number]"
      assert_select "input#safe_deposit_box_location_of_key", :name => "safe_deposit_box[location_of_key]"
      assert_select "textarea#safe_deposit_box_note", :name => "safe_deposit_box[note]"
    end
  end
end
