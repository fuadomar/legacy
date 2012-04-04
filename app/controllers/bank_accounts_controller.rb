class BankAccountsController < ApplicationController
  before_filter :authenticate_user!
  # GET /bank_accounts
  # GET /bank_accounts.xml
  def index
    @bank_accounts = BankAccount.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @bank_accounts }
    end
  end

  # GET /bank_accounts/1
  # GET /bank_accounts/1.xml
  def show
    @bank_account = BankAccount.find(params[:id])

    respond_to do |format|
      format.html { render :layout => false}
      format.xml  { render :xml => @bank_account }
    end
  end

  # GET /bank_accounts/new
  # GET /bank_accounts/new.xml
  def new
    @bank_account = BankAccount.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @bank_account }
    end
  end

  # GET /bank_accounts/1/edit
  def edit
    @bank_account = BankAccount.find(params[:id])
    render :layout => false
  end

  # POST /bank_accounts
  # POST /bank_accounts.xml
  def create
    session[:return_to] = request.referer
    @financial_account = current_user.default_plan.financial_accounts.first
    @financial_account = current_user.default_plan.financial_accounts.create(:title => 'Default financial account') if @financial_account.blank?
    @bank_account = @financial_account.bank_accounts.build(params[:bank_account])
    
    
    #@bank_account = BankAccount.new(params[:bank_account])

    respond_to do |format|
      if @bank_account.save
        format.html { redirect_to(session[:return_to], :notice => 'Bank account was successfully created.') }
        format.xml  { render :xml => @bank_account, :status => :created, :location => @bank_account }
      else
        format.html { redirect_to(session[:return_to], :notice => 'Not successful') }
        format.xml  { render :xml => @bank_account.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /bank_accounts/1
  # PUT /bank_accounts/1.xml
  def update
    @bank_account = BankAccount.find(params[:id])

    respond_to do |format|
      if @bank_account.update_attributes(params[:bank_account])
        format.html { redirect_to(financial_accounts_path, :notice => 'Bank account was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { redirect_to(financial_accounts_path, :notice => 'Not successful') }
        format.xml  { render :xml => @bank_account.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /bank_accounts/1
  # DELETE /bank_accounts/1.xml
  def destroy
    @bank_account = BankAccount.find(params[:id])
    @bank_account.destroy

    respond_to do |format|
      format.html { redirect_to(financial_accounts_path) }
      format.xml  { head :ok }
    end
  end
end
