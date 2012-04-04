require "spec_helper"

describe PensionPlansController do
  describe "routing" do

    it "routes to #index" do
      get("/pension_plans").should route_to("pension_plans#index")
    end

    it "routes to #new" do
      get("/pension_plans/new").should route_to("pension_plans#new")
    end

    it "routes to #show" do
      get("/pension_plans/1").should route_to("pension_plans#show", :id => "1")
    end

    it "routes to #edit" do
      get("/pension_plans/1/edit").should route_to("pension_plans#edit", :id => "1")
    end

    it "routes to #create" do
      post("/pension_plans").should route_to("pension_plans#create")
    end

    it "routes to #update" do
      put("/pension_plans/1").should route_to("pension_plans#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/pension_plans/1").should route_to("pension_plans#destroy", :id => "1")
    end

  end
end
