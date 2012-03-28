require "spec_helper"

describe RealEstatesController do
  describe "routing" do

    it "routes to #index" do
      get("/real_estates").should route_to("real_estates#index")
    end

    it "routes to #new" do
      get("/real_estates/new").should route_to("real_estates#new")
    end

    it "routes to #show" do
      get("/real_estates/1").should route_to("real_estates#show", :id => "1")
    end

    it "routes to #edit" do
      get("/real_estates/1/edit").should route_to("real_estates#edit", :id => "1")
    end

    it "routes to #create" do
      post("/real_estates").should route_to("real_estates#create")
    end

    it "routes to #update" do
      put("/real_estates/1").should route_to("real_estates#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/real_estates/1").should route_to("real_estates#destroy", :id => "1")
    end

  end
end
