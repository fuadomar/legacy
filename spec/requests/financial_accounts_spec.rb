require 'spec_helper'

describe "FinancialAccounts" do
  describe "GET /financial_accounts" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get financial_accounts_path
      response.status.should be(200)
    end
  end
end
