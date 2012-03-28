require 'spec_helper'

describe "possessions/edit.html.erb" do
  before(:each) do
    @possession = assign(:possession, stub_model(Possession,
      :plan_id => 1,
      :title => "MyString"
    ))
  end

  it "renders the edit possession form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => possessions_path(@possession), :method => "post" do
      assert_select "input#possession_plan_id", :name => "possession[plan_id]"
      assert_select "input#possession_title", :name => "possession[title]"
    end
  end
end
