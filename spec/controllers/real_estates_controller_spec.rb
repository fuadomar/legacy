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

describe RealEstatesController do

  # This should return the minimal set of attributes required to create a valid
  # RealEstate. As you add validations to RealEstate, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  describe "GET index" do
    it "assigns all real_estates as @real_estates" do
      real_estate = RealEstate.create! valid_attributes
      get :index
      assigns(:real_estates).should eq([real_estate])
    end
  end

  describe "GET show" do
    it "assigns the requested real_estate as @real_estate" do
      real_estate = RealEstate.create! valid_attributes
      get :show, :id => real_estate.id.to_s
      assigns(:real_estate).should eq(real_estate)
    end
  end

  describe "GET new" do
    it "assigns a new real_estate as @real_estate" do
      get :new
      assigns(:real_estate).should be_a_new(RealEstate)
    end
  end

  describe "GET edit" do
    it "assigns the requested real_estate as @real_estate" do
      real_estate = RealEstate.create! valid_attributes
      get :edit, :id => real_estate.id.to_s
      assigns(:real_estate).should eq(real_estate)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new RealEstate" do
        expect {
          post :create, :real_estate => valid_attributes
        }.to change(RealEstate, :count).by(1)
      end

      it "assigns a newly created real_estate as @real_estate" do
        post :create, :real_estate => valid_attributes
        assigns(:real_estate).should be_a(RealEstate)
        assigns(:real_estate).should be_persisted
      end

      it "redirects to the created real_estate" do
        post :create, :real_estate => valid_attributes
        response.should redirect_to(RealEstate.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved real_estate as @real_estate" do
        # Trigger the behavior that occurs when invalid params are submitted
        RealEstate.any_instance.stub(:save).and_return(false)
        post :create, :real_estate => {}
        assigns(:real_estate).should be_a_new(RealEstate)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        RealEstate.any_instance.stub(:save).and_return(false)
        post :create, :real_estate => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested real_estate" do
        real_estate = RealEstate.create! valid_attributes
        # Assuming there are no other real_estates in the database, this
        # specifies that the RealEstate created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        RealEstate.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => real_estate.id, :real_estate => {'these' => 'params'}
      end

      it "assigns the requested real_estate as @real_estate" do
        real_estate = RealEstate.create! valid_attributes
        put :update, :id => real_estate.id, :real_estate => valid_attributes
        assigns(:real_estate).should eq(real_estate)
      end

      it "redirects to the real_estate" do
        real_estate = RealEstate.create! valid_attributes
        put :update, :id => real_estate.id, :real_estate => valid_attributes
        response.should redirect_to(real_estate)
      end
    end

    describe "with invalid params" do
      it "assigns the real_estate as @real_estate" do
        real_estate = RealEstate.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        RealEstate.any_instance.stub(:save).and_return(false)
        put :update, :id => real_estate.id.to_s, :real_estate => {}
        assigns(:real_estate).should eq(real_estate)
      end

      it "re-renders the 'edit' template" do
        real_estate = RealEstate.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        RealEstate.any_instance.stub(:save).and_return(false)
        put :update, :id => real_estate.id.to_s, :real_estate => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested real_estate" do
      real_estate = RealEstate.create! valid_attributes
      expect {
        delete :destroy, :id => real_estate.id.to_s
      }.to change(RealEstate, :count).by(-1)
    end

    it "redirects to the real_estates list" do
      real_estate = RealEstate.create! valid_attributes
      delete :destroy, :id => real_estate.id.to_s
      response.should redirect_to(real_estates_url)
    end
  end

end
