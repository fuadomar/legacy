require 'spec_helper'

describe "possessions/new.html.erb" do
  before(:each) do
    assign(:possession, stub_model(Possession,
      :plan_id => 1,
      :title => "MyString"
    ).as_new_record)
  end

  it "renders new possession form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => possessions_path, :method => "post" do
      assert_select "input#possession_plan_id", :name => "possession[plan_id]"
      assert_select "input#possession_title", :name => "possession[title]"
    end
  end
end
