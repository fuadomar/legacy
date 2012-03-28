require 'spec_helper'

describe "real_estates/new.html.erb" do
  before(:each) do
    assign(:real_estate, stub_model(RealEstate,
      :possession_id => 1,
      :real_estate_type => "MyString",
      :address => "MyString",
      :city => "MyString",
      :state => "MyString",
      :deed => "MyString",
      :photo => "MyString",
      :note => "MyText"
    ).as_new_record)
  end

  it "renders new real_estate form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => real_estates_path, :method => "post" do
      assert_select "input#real_estate_possession_id", :name => "real_estate[possession_id]"
      assert_select "input#real_estate_real_estate_type", :name => "real_estate[real_estate_type]"
      assert_select "input#real_estate_address", :name => "real_estate[address]"
      assert_select "input#real_estate_city", :name => "real_estate[city]"
      assert_select "input#real_estate_state", :name => "real_estate[state]"
      assert_select "input#real_estate_deed", :name => "real_estate[deed]"
      assert_select "input#real_estate_photo", :name => "real_estate[photo]"
      assert_select "textarea#real_estate_note", :name => "real_estate[note]"
    end
  end
end
