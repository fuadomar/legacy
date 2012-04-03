require 'spec_helper'

describe "others/new.html.erb" do
  before(:each) do
    assign(:other, stub_model(Other,
      :possession_id => 1,
      :name => "MyString",
      :photo => "MyString",
      :document => "MyString",
      :note => "MyText"
    ).as_new_record)
  end

  it "renders new other form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => others_path, :method => "post" do
      assert_select "input#other_possession_id", :name => "other[possession_id]"
      assert_select "input#other_name", :name => "other[name]"
      assert_select "input#other_photo", :name => "other[photo]"
      assert_select "input#other_document", :name => "other[document]"
      assert_select "textarea#other_note", :name => "other[note]"
    end
  end
end
