require "spec_helper"

describe JewelriesController do
  describe "routing" do

    it "routes to #index" do
      get("/jewelries").should route_to("jewelries#index")
    end

    it "routes to #new" do
      get("/jewelries/new").should route_to("jewelries#new")
    end

    it "routes to #show" do
      get("/jewelries/1").should route_to("jewelries#show", :id => "1")
    end

    it "routes to #edit" do
      get("/jewelries/1/edit").should route_to("jewelries#edit", :id => "1")
    end

    it "routes to #create" do
      post("/jewelries").should route_to("jewelries#create")
    end

    it "routes to #update" do
      put("/jewelries/1").should route_to("jewelries#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/jewelries/1").should route_to("jewelries#destroy", :id => "1")
    end

  end
end
