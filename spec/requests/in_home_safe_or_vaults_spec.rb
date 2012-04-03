require 'spec_helper'

describe "InHomeSafeOrVaults" do
  describe "GET /in_home_safe_or_vaults" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get in_home_safe_or_vaults_path
      response.status.should be(200)
    end
  end
end
