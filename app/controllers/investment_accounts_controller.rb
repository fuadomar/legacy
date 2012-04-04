class InvestmentAccountsController < ApplicationController
  # GET /investment_accounts
  # GET /investment_accounts.xml
  def index
    @investment_accounts = InvestmentAccount.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @investment_accounts }
    end
  end

  # GET /investment_accounts/1
  # GET /investment_accounts/1.xml
  def show
    @investment_account = InvestmentAccount.find(params[:id])

    respond_to do |format|
      format.html { render :layout => false}
      format.xml  { render :xml => @investment_account }
    end
  end

  # GET /investment_accounts/new
  # GET /investment_accounts/new.xml
  def new
    @investment_account = InvestmentAccount.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @investment_account }
    end
  end

  # GET /investment_accounts/1/edit
  def edit
    @investment_account = InvestmentAccount.find(params[:id])
    render :layout => false
  end

  # POST /investment_accounts
  # POST /investment_accounts.xml
  def create
    #@investment_account = InvestmentAccount.new(params[:investment_account])
    
    session[:return_to] = request.referer
    @financial_account = current_user.default_plan.financial_accounts.first
    @financial_account = current_user.default_plan.financial_accounts.create(:title => 'Default financial account') if @financial_account.blank?
    @investment_account = @financial_account.investment_accounts.build(params[:investment_account])

    respond_to do |format|
      if @investment_account.save
        format.html { redirect_to(session[:return_to], :notice => 'Investment account was successfully created.') }
        format.xml  { render :xml => @investment_account, :status => :created, :location => @investment_account }
      else
        format.html { redirect_to(session[:return_to], :notice => 'Not successful') }
        format.xml  { render :xml => @investment_account.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /investment_accounts/1
  # PUT /investment_accounts/1.xml
  def update
    @investment_account = InvestmentAccount.find(params[:id])

    respond_to do |format|
      if @investment_account.update_attributes(params[:investment_account])
        format.html { redirect_to(financial_accounts_path, :notice => 'Investment account was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { redirect_to(financial_accounts_path, :notice => 'Not successful') }
        format.xml  { render :xml => @investment_account.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /investment_accounts/1
  # DELETE /investment_accounts/1.xml
  def destroy
    @investment_account = InvestmentAccount.find(params[:id])
    @investment_account.destroy

    respond_to do |format|
      format.html { redirect_to(financial_accounts_path) }
      format.xml  { head :ok }
    end
  end
end
