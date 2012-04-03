require 'spec_helper'

describe "furnitures/new.html.erb" do
  before(:each) do
    assign(:furniture, stub_model(Furniture,
      :possession_id => 1,
      :name => "MyString",
      :photo => "MyString",
      :document => "MyString",
      :note => "MyText"
    ).as_new_record)
  end

  it "renders new furniture form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => furnitures_path, :method => "post" do
      assert_select "input#furniture_possession_id", :name => "furniture[possession_id]"
      assert_select "input#furniture_name", :name => "furniture[name]"
      assert_select "input#furniture_photo", :name => "furniture[photo]"
      assert_select "input#furniture_document", :name => "furniture[document]"
      assert_select "textarea#furniture_note", :name => "furniture[note]"
    end
  end
end
