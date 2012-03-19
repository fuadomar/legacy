require 'spec_helper'

describe MemorialsController do

  before(:each) do
    @user = Factory(:user)
    log_in_as(@user)
  end

  describe "require no user" do
    it "should get index" do
      get :index
      response.should be_success
    end
  end

  describe "require user" do
    it "should get show" do
      plan = @user.plans.create(:title => 'test plan')
      memorial = plan.memorials.create(:organizer_name => 'Testname')
      get :show, :id => memorial.id
      response.should be_success
    end
  end
end