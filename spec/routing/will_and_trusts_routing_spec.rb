require "spec_helper"

describe WillAndTrustsController do
  describe "routing" do

    it "routes to #index" do
      get("/will_and_trusts").should route_to("will_and_trusts#index")
    end

    it "routes to #new" do
      get("/will_and_trusts/new").should route_to("will_and_trusts#new")
    end

    it "routes to #show" do
      get("/will_and_trusts/1").should route_to("will_and_trusts#show", :id => "1")
    end

    it "routes to #edit" do
      get("/will_and_trusts/1/edit").should route_to("will_and_trusts#edit", :id => "1")
    end

    it "routes to #create" do
      post("/will_and_trusts").should route_to("will_and_trusts#create")
    end

    it "routes to #update" do
      put("/will_and_trusts/1").should route_to("will_and_trusts#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/will_and_trusts/1").should route_to("will_and_trusts#destroy", :id => "1")
    end

  end
end
