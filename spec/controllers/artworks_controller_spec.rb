require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe ArtworksController do

  # This should return the minimal set of attributes required to create a valid
  # Artwork. As you add validations to Artwork, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  describe "GET index" do
    it "assigns all artworks as @artworks" do
      artwork = Artwork.create! valid_attributes
      get :index
      assigns(:artworks).should eq([artwork])
    end
  end

  describe "GET show" do
    it "assigns the requested artwork as @artwork" do
      artwork = Artwork.create! valid_attributes
      get :show, :id => artwork.id.to_s
      assigns(:artwork).should eq(artwork)
    end
  end

  describe "GET new" do
    it "assigns a new artwork as @artwork" do
      get :new
      assigns(:artwork).should be_a_new(Artwork)
    end
  end

  describe "GET edit" do
    it "assigns the requested artwork as @artwork" do
      artwork = Artwork.create! valid_attributes
      get :edit, :id => artwork.id.to_s
      assigns(:artwork).should eq(artwork)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Artwork" do
        expect {
          post :create, :artwork => valid_attributes
        }.to change(Artwork, :count).by(1)
      end

      it "assigns a newly created artwork as @artwork" do
        post :create, :artwork => valid_attributes
        assigns(:artwork).should be_a(Artwork)
        assigns(:artwork).should be_persisted
      end

      it "redirects to the created artwork" do
        post :create, :artwork => valid_attributes
        response.should redirect_to(Artwork.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved artwork as @artwork" do
        # Trigger the behavior that occurs when invalid params are submitted
        Artwork.any_instance.stub(:save).and_return(false)
        post :create, :artwork => {}
        assigns(:artwork).should be_a_new(Artwork)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Artwork.any_instance.stub(:save).and_return(false)
        post :create, :artwork => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested artwork" do
        artwork = Artwork.create! valid_attributes
        # Assuming there are no other artworks in the database, this
        # specifies that the Artwork created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Artwork.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => artwork.id, :artwork => {'these' => 'params'}
      end

      it "assigns the requested artwork as @artwork" do
        artwork = Artwork.create! valid_attributes
        put :update, :id => artwork.id, :artwork => valid_attributes
        assigns(:artwork).should eq(artwork)
      end

      it "redirects to the artwork" do
        artwork = Artwork.create! valid_attributes
        put :update, :id => artwork.id, :artwork => valid_attributes
        response.should redirect_to(artwork)
      end
    end

    describe "with invalid params" do
      it "assigns the artwork as @artwork" do
        artwork = Artwork.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Artwork.any_instance.stub(:save).and_return(false)
        put :update, :id => artwork.id.to_s, :artwork => {}
        assigns(:artwork).should eq(artwork)
      end

      it "re-renders the 'edit' template" do
        artwork = Artwork.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Artwork.any_instance.stub(:save).and_return(false)
        put :update, :id => artwork.id.to_s, :artwork => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested artwork" do
      artwork = Artwork.create! valid_attributes
      expect {
        delete :destroy, :id => artwork.id.to_s
      }.to change(Artwork, :count).by(-1)
    end

    it "redirects to the artworks list" do
      artwork = Artwork.create! valid_attributes
      delete :destroy, :id => artwork.id.to_s
      response.should redirect_to(artworks_url)
    end
  end

end