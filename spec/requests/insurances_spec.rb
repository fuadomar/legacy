require 'spec_helper'

describe "Insurances" do
  describe "GET /insurances" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get insurances_path
      response.status.should be(200)
    end
  end
end
