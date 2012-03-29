require 'spec_helper'

describe "contacts/new.html.erb" do
  before(:each) do
    assign(:contact, stub_model(Contact,
      :user_id => 1,
      :first_name => "MyString",
      :last_name => "MyString",
      :email => "MyString",
      :phone_number => "MyString",
      :address => "MyText",
      :comments => "MyText"
    ).as_new_record)
  end

  it "renders new contact form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => contacts_path, :method => "post" do
      assert_select "input#contact_user_id", :name => "contact[user_id]"
      assert_select "input#contact_first_name", :name => "contact[first_name]"
      assert_select "input#contact_last_name", :name => "contact[last_name]"
      assert_select "input#contact_email", :name => "contact[email]"
      assert_select "input#contact_phone_number", :name => "contact[phone_number]"
      assert_select "textarea#contact_address", :name => "contact[address]"
      assert_select "textarea#contact_comments", :name => "contact[comments]"
    end
  end
end
