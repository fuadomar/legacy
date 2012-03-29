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

describe FinancialAccountsController do

  # This should return the minimal set of attributes required to create a valid
  # FinancialAccount. As you add validations to FinancialAccount, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  describe "GET index" do
    it "assigns all financial_accounts as @financial_accounts" do
      financial_account = FinancialAccount.create! valid_attributes
      get :index
      assigns(:financial_accounts).should eq([financial_account])
    end
  end

  describe "GET show" do
    it "assigns the requested financial_account as @financial_account" do
      financial_account = FinancialAccount.create! valid_attributes
      get :show, :id => financial_account.id.to_s
      assigns(:financial_account).should eq(financial_account)
    end
  end

  describe "GET new" do
    it "assigns a new financial_account as @financial_account" do
      get :new
      assigns(:financial_account).should be_a_new(FinancialAccount)
    end
  end

  describe "GET edit" do
    it "assigns the requested financial_account as @financial_account" do
      financial_account = FinancialAccount.create! valid_attributes
      get :edit, :id => financial_account.id.to_s
      assigns(:financial_account).should eq(financial_account)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new FinancialAccount" do
        expect {
          post :create, :financial_account => valid_attributes
        }.to change(FinancialAccount, :count).by(1)
      end

      it "assigns a newly created financial_account as @financial_account" do
        post :create, :financial_account => valid_attributes
        assigns(:financial_account).should be_a(FinancialAccount)
        assigns(:financial_account).should be_persisted
      end

      it "redirects to the created financial_account" do
        post :create, :financial_account => valid_attributes
        response.should redirect_to(FinancialAccount.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved financial_account as @financial_account" do
        # Trigger the behavior that occurs when invalid params are submitted
        FinancialAccount.any_instance.stub(:save).and_return(false)
        post :create, :financial_account => {}
        assigns(:financial_account).should be_a_new(FinancialAccount)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        FinancialAccount.any_instance.stub(:save).and_return(false)
        post :create, :financial_account => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested financial_account" do
        financial_account = FinancialAccount.create! valid_attributes
        # Assuming there are no other financial_accounts in the database, this
        # specifies that the FinancialAccount created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        FinancialAccount.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => financial_account.id, :financial_account => {'these' => 'params'}
      end

      it "assigns the requested financial_account as @financial_account" do
        financial_account = FinancialAccount.create! valid_attributes
        put :update, :id => financial_account.id, :financial_account => valid_attributes
        assigns(:financial_account).should eq(financial_account)
      end

      it "redirects to the financial_account" do
        financial_account = FinancialAccount.create! valid_attributes
        put :update, :id => financial_account.id, :financial_account => valid_attributes
        response.should redirect_to(financial_account)
      end
    end

    describe "with invalid params" do
      it "assigns the financial_account as @financial_account" do
        financial_account = FinancialAccount.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        FinancialAccount.any_instance.stub(:save).and_return(false)
        put :update, :id => financial_account.id.to_s, :financial_account => {}
        assigns(:financial_account).should eq(financial_account)
      end

      it "re-renders the 'edit' template" do
        financial_account = FinancialAccount.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        FinancialAccount.any_instance.stub(:save).and_return(false)
        put :update, :id => financial_account.id.to_s, :financial_account => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested financial_account" do
      financial_account = FinancialAccount.create! valid_attributes
      expect {
        delete :destroy, :id => financial_account.id.to_s
      }.to change(FinancialAccount, :count).by(-1)
    end

    it "redirects to the financial_accounts list" do
      financial_account = FinancialAccount.create! valid_attributes
      delete :destroy, :id => financial_account.id.to_s
      response.should redirect_to(financial_accounts_url)
    end
  end

end
