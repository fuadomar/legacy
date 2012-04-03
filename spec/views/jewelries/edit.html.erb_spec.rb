require 'spec_helper'

describe "jewelries/edit.html.erb" do
  before(:each) do
    @jewelry = assign(:jewelry, stub_model(Jewelry,
      :possession_id => 1,
      :name => "MyString",
      :photo => "MyString",
      :document => "MyString",
      :note => "MyText"
    ))
  end

  it "renders the edit jewelry form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => jewelries_path(@jewelry), :method => "post" do
      assert_select "input#jewelry_possession_id", :name => "jewelry[possession_id]"
      assert_select "input#jewelry_name", :name => "jewelry[name]"
      assert_select "input#jewelry_photo", :name => "jewelry[photo]"
      assert_select "input#jewelry_document", :name => "jewelry[document]"
      assert_select "textarea#jewelry_note", :name => "jewelry[note]"
    end
  end
end
