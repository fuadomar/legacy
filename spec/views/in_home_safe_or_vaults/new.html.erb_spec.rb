require 'spec_helper'

describe "in_home_safe_or_vaults/new.html.erb" do
  before(:each) do
    assign(:in_home_safe_or_vault, stub_model(InHomeSafeOrVault,
      :possession_id => 1,
      :name => "MyString",
      :location => "MyString",
      :code => "MyString",
      :photo => "MyString",
      :note => "MyText"
    ).as_new_record)
  end

  it "renders new in_home_safe_or_vault form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => in_home_safe_or_vaults_path, :method => "post" do
      assert_select "input#in_home_safe_or_vault_possession_id", :name => "in_home_safe_or_vault[possession_id]"
      assert_select "input#in_home_safe_or_vault_name", :name => "in_home_safe_or_vault[name]"
      assert_select "input#in_home_safe_or_vault_location", :name => "in_home_safe_or_vault[location]"
      assert_select "input#in_home_safe_or_vault_code", :name => "in_home_safe_or_vault[code]"
      assert_select "input#in_home_safe_or_vault_photo", :name => "in_home_safe_or_vault[photo]"
      assert_select "textarea#in_home_safe_or_vault_note", :name => "in_home_safe_or_vault[note]"
    end
  end
end
