require "spec_helper"

describe SafeDepositBoxesController do
  describe "routing" do

    it "routes to #index" do
      get("/safe_deposit_boxes").should route_to("safe_deposit_boxes#index")
    end

    it "routes to #new" do
      get("/safe_deposit_boxes/new").should route_to("safe_deposit_boxes#new")
    end

    it "routes to #show" do
      get("/safe_deposit_boxes/1").should route_to("safe_deposit_boxes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/safe_deposit_boxes/1/edit").should route_to("safe_deposit_boxes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/safe_deposit_boxes").should route_to("safe_deposit_boxes#create")
    end

    it "routes to #update" do
      put("/safe_deposit_boxes/1").should route_to("safe_deposit_boxes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/safe_deposit_boxes/1").should route_to("safe_deposit_boxes#destroy", :id => "1")
    end

  end
end
