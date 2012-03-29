require 'spec_helper'

describe "WillAndTrusts" do
  describe "GET /will_and_trusts" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get will_and_trusts_path
      response.status.should be(200)
    end
  end
end
