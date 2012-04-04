require "spec_helper"

describe InvestmentAccountsController do
  describe "routing" do

    it "routes to #index" do
      get("/investment_accounts").should route_to("investment_accounts#index")
    end

    it "routes to #new" do
      get("/investment_accounts/new").should route_to("investment_accounts#new")
    end

    it "routes to #show" do
      get("/investment_accounts/1").should route_to("investment_accounts#show", :id => "1")
    end

    it "routes to #edit" do
      get("/investment_accounts/1/edit").should route_to("investment_accounts#edit", :id => "1")
    end

    it "routes to #create" do
      post("/investment_accounts").should route_to("investment_accounts#create")
    end

    it "routes to #update" do
      put("/investment_accounts/1").should route_to("investment_accounts#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/investment_accounts/1").should route_to("investment_accounts#destroy", :id => "1")
    end

  end
end
