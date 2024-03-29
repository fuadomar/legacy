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

describe InvestmentAccountsController do

  # This should return the minimal set of attributes required to create a valid
  # InvestmentAccount. As you add validations to InvestmentAccount, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  describe "GET index" do
    it "assigns all investment_accounts as @investment_accounts" do
      investment_account = InvestmentAccount.create! valid_attributes
      get :index
      assigns(:investment_accounts).should eq([investment_account])
    end
  end

  describe "GET show" do
    it "assigns the requested investment_account as @investment_account" do
      investment_account = InvestmentAccount.create! valid_attributes
      get :show, :id => investment_account.id.to_s
      assigns(:investment_account).should eq(investment_account)
    end
  end

  describe "GET new" do
    it "assigns a new investment_account as @investment_account" do
      get :new
      assigns(:investment_account).should be_a_new(InvestmentAccount)
    end
  end

  describe "GET edit" do
    it "assigns the requested investment_account as @investment_account" do
      investment_account = InvestmentAccount.create! valid_attributes
      get :edit, :id => investment_account.id.to_s
      assigns(:investment_account).should eq(investment_account)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new InvestmentAccount" do
        expect {
          post :create, :investment_account => valid_attributes
        }.to change(InvestmentAccount, :count).by(1)
      end

      it "assigns a newly created investment_account as @investment_account" do
        post :create, :investment_account => valid_attributes
        assigns(:investment_account).should be_a(InvestmentAccount)
        assigns(:investment_account).should be_persisted
      end

      it "redirects to the created investment_account" do
        post :create, :investment_account => valid_attributes
        response.should redirect_to(InvestmentAccount.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved investment_account as @investment_account" do
        # Trigger the behavior that occurs when invalid params are submitted
        InvestmentAccount.any_instance.stub(:save).and_return(false)
        post :create, :investment_account => {}
        assigns(:investment_account).should be_a_new(InvestmentAccount)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        InvestmentAccount.any_instance.stub(:save).and_return(false)
        post :create, :investment_account => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested investment_account" do
        investment_account = InvestmentAccount.create! valid_attributes
        # Assuming there are no other investment_accounts in the database, this
        # specifies that the InvestmentAccount created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        InvestmentAccount.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => investment_account.id, :investment_account => {'these' => 'params'}
      end

      it "assigns the requested investment_account as @investment_account" do
        investment_account = InvestmentAccount.create! valid_attributes
        put :update, :id => investment_account.id, :investment_account => valid_attributes
        assigns(:investment_account).should eq(investment_account)
      end

      it "redirects to the investment_account" do
        investment_account = InvestmentAccount.create! valid_attributes
        put :update, :id => investment_account.id, :investment_account => valid_attributes
        response.should redirect_to(investment_account)
      end
    end

    describe "with invalid params" do
      it "assigns the investment_account as @investment_account" do
        investment_account = InvestmentAccount.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        InvestmentAccount.any_instance.stub(:save).and_return(false)
        put :update, :id => investment_account.id.to_s, :investment_account => {}
        assigns(:investment_account).should eq(investment_account)
      end

      it "re-renders the 'edit' template" do
        investment_account = InvestmentAccount.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        InvestmentAccount.any_instance.stub(:save).and_return(false)
        put :update, :id => investment_account.id.to_s, :investment_account => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested investment_account" do
      investment_account = InvestmentAccount.create! valid_attributes
      expect {
        delete :destroy, :id => investment_account.id.to_s
      }.to change(InvestmentAccount, :count).by(-1)
    end

    it "redirects to the investment_accounts list" do
      investment_account = InvestmentAccount.create! valid_attributes
      delete :destroy, :id => investment_account.id.to_s
      response.should redirect_to(investment_accounts_url)
    end
  end

end
