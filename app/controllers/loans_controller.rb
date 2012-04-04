class LoansController < ApplicationController
  # GET /loans
  # GET /loans.xml
  def index
    @loans = Loan.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @loans }
    end
  end

  # GET /loans/1
  # GET /loans/1.xml
  def show
    @loan = Loan.find(params[:id])

    respond_to do |format|
      format.html { render :layout => false}
      format.xml  { render :xml => @loan }
    end
  end

  # GET /loans/new
  # GET /loans/new.xml
  def new
    @loan = Loan.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @loan }
    end
  end

  # GET /loans/1/edit
  def edit
    @loan = Loan.find(params[:id])
    render :layout => false
  end

  # POST /loans
  # POST /loans.xml
  def create
    session[:return_to] = request.referer
    @financial_account = current_user.default_plan.financial_accounts.first
    @financial_account = current_user.default_plan.financial_accounts.create(:title => 'Default financial account') if @financial_account.blank?
    @loan = @financial_account.loans.build(params[:loan])

    respond_to do |format|
      if @loan.save
        format.html { redirect_to(session[:return_to], :notice => 'Loan was successfully created.') }
        format.xml  { render :xml => @loan, :status => :created, :location => @loan }
      else
        format.html { redirect_to(session[:return_to], :notice => 'Not successful') }
        format.xml  { render :xml => @loan.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /loans/1
  # PUT /loans/1.xml
  def update
    @loan = Loan.find(params[:id])

    respond_to do |format|
      if @loan.update_attributes(params[:loan])
        format.html { redirect_to(financial_accounts_path, :notice => 'Loan was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { redirect_to(financial_accounts_path, :notice => 'Not successful') }
        format.xml  { render :xml => @loan.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /loans/1
  # DELETE /loans/1.xml
  def destroy
    @loan = Loan.find(params[:id])
    @loan.destroy

    respond_to do |format|
      format.html { redirect_to(financial_accounts_path) }
      format.xml  { head :ok }
    end
  end
end
