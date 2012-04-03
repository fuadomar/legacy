require "spec_helper"

describe FurnituresController do
  describe "routing" do

    it "routes to #index" do
      get("/furnitures").should route_to("furnitures#index")
    end

    it "routes to #new" do
      get("/furnitures/new").should route_to("furnitures#new")
    end

    it "routes to #show" do
      get("/furnitures/1").should route_to("furnitures#show", :id => "1")
    end

    it "routes to #edit" do
      get("/furnitures/1/edit").should route_to("furnitures#edit", :id => "1")
    end

    it "routes to #create" do
      post("/furnitures").should route_to("furnitures#create")
    end

    it "routes to #update" do
      put("/furnitures/1").should route_to("furnitures#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/furnitures/1").should route_to("furnitures#destroy", :id => "1")
    end

  end
end
