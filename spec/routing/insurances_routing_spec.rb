require "spec_helper"

describe InsurancesController do
  describe "routing" do

    it "routes to #index" do
      get("/insurances").should route_to("insurances#index")
    end

    it "routes to #new" do
      get("/insurances/new").should route_to("insurances#new")
    end

    it "routes to #show" do
      get("/insurances/1").should route_to("insurances#show", :id => "1")
    end

    it "routes to #edit" do
      get("/insurances/1/edit").should route_to("insurances#edit", :id => "1")
    end

    it "routes to #create" do
      post("/insurances").should route_to("insurances#create")
    end

    it "routes to #update" do
      put("/insurances/1").should route_to("insurances#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/insurances/1").should route_to("insurances#destroy", :id => "1")
    end

  end
end
