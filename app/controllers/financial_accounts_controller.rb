class FinancialAccountsController < ApplicationController
  before_filter :authenticate_user!
  # GET /financial_accounts
  # GET /financial_accounts.xml
  def index
    @financial_accounts = current_user.default_plan.financial_accounts.includes(:bank_accounts)
    @bank_account = BankAccount.new
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @financial_accounts }
    end
  end

  # GET /financial_accounts/1
  # GET /financial_accounts/1.xml
  def show
    @financial_account = FinancialAccount.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @financial_account }
    end
  end

  # GET /financial_accounts/new
  # GET /financial_accounts/new.xml
  def new
    @financial_account = FinancialAccount.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @financial_account }
    end
  end

  # GET /financial_accounts/1/edit
  def edit
    @financial_account = FinancialAccount.find(params[:id])
  end

  # POST /financial_accounts
  # POST /financial_accounts.xml
  def create
    @financial_account = FinancialAccount.new(params[:financial_account])

    respond_to do |format|
      if @financial_account.save
        format.html { redirect_to(@financial_account, :notice => 'Financial account was successfully created.') }
        format.xml  { render :xml => @financial_account, :status => :created, :location => @financial_account }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @financial_account.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /financial_accounts/1
  # PUT /financial_accounts/1.xml
  def update
    @financial_account = FinancialAccount.find(params[:id])

    respond_to do |format|
      if @financial_account.update_attributes(params[:financial_account])
        format.html { redirect_to(@financial_account, :notice => 'Financial account was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @financial_account.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /financial_accounts/1
  # DELETE /financial_accounts/1.xml
  def destroy
    @financial_account = FinancialAccount.find(params[:id])
    @financial_account.destroy

    respond_to do |format|
      format.html { redirect_to(financial_accounts_url) }
      format.xml  { head :ok }
    end
  end
end
