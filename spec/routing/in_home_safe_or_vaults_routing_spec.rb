require "spec_helper"

describe InHomeSafeOrVaultsController do
  describe "routing" do

    it "routes to #index" do
      get("/in_home_safe_or_vaults").should route_to("in_home_safe_or_vaults#index")
    end

    it "routes to #new" do
      get("/in_home_safe_or_vaults/new").should route_to("in_home_safe_or_vaults#new")
    end

    it "routes to #show" do
      get("/in_home_safe_or_vaults/1").should route_to("in_home_safe_or_vaults#show", :id => "1")
    end

    it "routes to #edit" do
      get("/in_home_safe_or_vaults/1/edit").should route_to("in_home_safe_or_vaults#edit", :id => "1")
    end

    it "routes to #create" do
      post("/in_home_safe_or_vaults").should route_to("in_home_safe_or_vaults#create")
    end

    it "routes to #update" do
      put("/in_home_safe_or_vaults/1").should route_to("in_home_safe_or_vaults#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/in_home_safe_or_vaults/1").should route_to("in_home_safe_or_vaults#destroy", :id => "1")
    end

  end
end
