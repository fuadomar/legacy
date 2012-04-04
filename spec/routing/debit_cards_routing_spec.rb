require "spec_helper"

describe DebitCardsController do
  describe "routing" do

    it "routes to #index" do
      get("/debit_cards").should route_to("debit_cards#index")
    end

    it "routes to #new" do
      get("/debit_cards/new").should route_to("debit_cards#new")
    end

    it "routes to #show" do
      get("/debit_cards/1").should route_to("debit_cards#show", :id => "1")
    end

    it "routes to #edit" do
      get("/debit_cards/1/edit").should route_to("debit_cards#edit", :id => "1")
    end

    it "routes to #create" do
      post("/debit_cards").should route_to("debit_cards#create")
    end

    it "routes to #update" do
      put("/debit_cards/1").should route_to("debit_cards#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/debit_cards/1").should route_to("debit_cards#destroy", :id => "1")
    end

  end
end
