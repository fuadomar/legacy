require "spec_helper"

describe OthersController do
  describe "routing" do

    it "routes to #index" do
      get("/others").should route_to("others#index")
    end

    it "routes to #new" do
      get("/others/new").should route_to("others#new")
    end

    it "routes to #show" do
      get("/others/1").should route_to("others#show", :id => "1")
    end

    it "routes to #edit" do
      get("/others/1/edit").should route_to("others#edit", :id => "1")
    end

    it "routes to #create" do
      post("/others").should route_to("others#create")
    end

    it "routes to #update" do
      put("/others/1").should route_to("others#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/others/1").should route_to("others#destroy", :id => "1")
    end

  end
end
