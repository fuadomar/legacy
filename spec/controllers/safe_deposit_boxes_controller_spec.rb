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

describe SafeDepositBoxesController do

  # This should return the minimal set of attributes required to create a valid
  # SafeDepositBox. As you add validations to SafeDepositBox, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  describe "GET index" do
    it "assigns all safe_deposit_boxes as @safe_deposit_boxes" do
      safe_deposit_box = SafeDepositBox.create! valid_attributes
      get :index
      assigns(:safe_deposit_boxes).should eq([safe_deposit_box])
    end
  end

  describe "GET show" do
    it "assigns the requested safe_deposit_box as @safe_deposit_box" do
      safe_deposit_box = SafeDepositBox.create! valid_attributes
      get :show, :id => safe_deposit_box.id.to_s
      assigns(:safe_deposit_box).should eq(safe_deposit_box)
    end
  end

  describe "GET new" do
    it "assigns a new safe_deposit_box as @safe_deposit_box" do
      get :new
      assigns(:safe_deposit_box).should be_a_new(SafeDepositBox)
    end
  end

  describe "GET edit" do
    it "assigns the requested safe_deposit_box as @safe_deposit_box" do
      safe_deposit_box = SafeDepositBox.create! valid_attributes
      get :edit, :id => safe_deposit_box.id.to_s
      assigns(:safe_deposit_box).should eq(safe_deposit_box)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new SafeDepositBox" do
        expect {
          post :create, :safe_deposit_box => valid_attributes
        }.to change(SafeDepositBox, :count).by(1)
      end

      it "assigns a newly created safe_deposit_box as @safe_deposit_box" do
        post :create, :safe_deposit_box => valid_attributes
        assigns(:safe_deposit_box).should be_a(SafeDepositBox)
        assigns(:safe_deposit_box).should be_persisted
      end

      it "redirects to the created safe_deposit_box" do
        post :create, :safe_deposit_box => valid_attributes
        response.should redirect_to(SafeDepositBox.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved safe_deposit_box as @safe_deposit_box" do
        # Trigger the behavior that occurs when invalid params are submitted
        SafeDepositBox.any_instance.stub(:save).and_return(false)
        post :create, :safe_deposit_box => {}
        assigns(:safe_deposit_box).should be_a_new(SafeDepositBox)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        SafeDepositBox.any_instance.stub(:save).and_return(false)
        post :create, :safe_deposit_box => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested safe_deposit_box" do
        safe_deposit_box = SafeDepositBox.create! valid_attributes
        # Assuming there are no other safe_deposit_boxes in the database, this
        # specifies that the SafeDepositBox created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        SafeDepositBox.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => safe_deposit_box.id, :safe_deposit_box => {'these' => 'params'}
      end

      it "assigns the requested safe_deposit_box as @safe_deposit_box" do
        safe_deposit_box = SafeDepositBox.create! valid_attributes
        put :update, :id => safe_deposit_box.id, :safe_deposit_box => valid_attributes
        assigns(:safe_deposit_box).should eq(safe_deposit_box)
      end

      it "redirects to the safe_deposit_box" do
        safe_deposit_box = SafeDepositBox.create! valid_attributes
        put :update, :id => safe_deposit_box.id, :safe_deposit_box => valid_attributes
        response.should redirect_to(safe_deposit_box)
      end
    end

    describe "with invalid params" do
      it "assigns the safe_deposit_box as @safe_deposit_box" do
        safe_deposit_box = SafeDepositBox.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        SafeDepositBox.any_instance.stub(:save).and_return(false)
        put :update, :id => safe_deposit_box.id.to_s, :safe_deposit_box => {}
        assigns(:safe_deposit_box).should eq(safe_deposit_box)
      end

      it "re-renders the 'edit' template" do
        safe_deposit_box = SafeDepositBox.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        SafeDepositBox.any_instance.stub(:save).and_return(false)
        put :update, :id => safe_deposit_box.id.to_s, :safe_deposit_box => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested safe_deposit_box" do
      safe_deposit_box = SafeDepositBox.create! valid_attributes
      expect {
        delete :destroy, :id => safe_deposit_box.id.to_s
      }.to change(SafeDepositBox, :count).by(-1)
    end

    it "redirects to the safe_deposit_boxes list" do
      safe_deposit_box = SafeDepositBox.create! valid_attributes
      delete :destroy, :id => safe_deposit_box.id.to_s
      response.should redirect_to(safe_deposit_boxes_url)
    end
  end

end
