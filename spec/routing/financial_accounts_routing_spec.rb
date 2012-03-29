require "spec_helper"

describe FinancialAccountsController do
  describe "routing" do

    it "routes to #index" do
      get("/financial_accounts").should route_to("financial_accounts#index")
    end

    it "routes to #new" do
      get("/financial_accounts/new").should route_to("financial_accounts#new")
    end

    it "routes to #show" do
      get("/financial_accounts/1").should route_to("financial_accounts#show", :id => "1")
    end

    it "routes to #edit" do
      get("/financial_accounts/1/edit").should route_to("financial_accounts#edit", :id => "1")
    end

    it "routes to #create" do
      post("/financial_accounts").should route_to("financial_accounts#create")
    end

    it "routes to #update" do
      put("/financial_accounts/1").should route_to("financial_accounts#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/financial_accounts/1").should route_to("financial_accounts#destroy", :id => "1")
    end

  end
end
