require 'spec_helper'

describe "furnitures/edit.html.erb" do
  before(:each) do
    @furniture = assign(:furniture, stub_model(Furniture,
      :possession_id => 1,
      :name => "MyString",
      :photo => "MyString",
      :document => "MyString",
      :note => "MyText"
    ))
  end

  it "renders the edit furniture form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => furnitures_path(@furniture), :method => "post" do
      assert_select "input#furniture_possession_id", :name => "furniture[possession_id]"
      assert_select "input#furniture_name", :name => "furniture[name]"
      assert_select "input#furniture_photo", :name => "furniture[photo]"
      assert_select "input#furniture_document", :name => "furniture[document]"
      assert_select "textarea#furniture_note", :name => "furniture[note]"
    end
  end
end
