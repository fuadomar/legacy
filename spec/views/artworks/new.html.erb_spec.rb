require 'spec_helper'

describe "artworks/new.html.erb" do
  before(:each) do
    assign(:artwork, stub_model(Artwork,
      :possession_id => 1,
      :name => "MyString",
      :photo => "MyString",
      :document => "MyString",
      :note => "MyText"
    ).as_new_record)
  end

  it "renders new artwork form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => artworks_path, :method => "post" do
      assert_select "input#artwork_possession_id", :name => "artwork[possession_id]"
      assert_select "input#artwork_name", :name => "artwork[name]"
      assert_select "input#artwork_photo", :name => "artwork[photo]"
      assert_select "input#artwork_document", :name => "artwork[document]"
      assert_select "textarea#artwork_note", :name => "artwork[note]"
    end
  end
end
