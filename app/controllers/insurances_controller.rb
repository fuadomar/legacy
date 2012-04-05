class InsurancesController < ApplicationController
  before_filter :authenticate_user!
  # GET /insurances
  # GET /insurances.xml
  def index
    @insurances = Insurance.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @insurances }
    end
  end

  # GET /insurances/1
  # GET /insurances/1.xml
  def show
    @insurance = Insurance.find(params[:id])

    respond_to do |format|
      format.html { render :layout => false}
      format.xml  { render :xml => @insurance }
    end
  end

  # GET /insurances/new
  # GET /insurances/new.xml
  def new
    @insurance = Insurance.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @insurance }
    end
  end

  # GET /insurances/1/edit
  def edit
    @insurance = Insurance.find(params[:id])
    render :layout => false
  end

  # POST /insurances
  # POST /insurances.xml
  def create
    session[:return_to] = request.referer
    @financial_account = current_user.default_plan.financial_accounts.first
    @financial_account = current_user.default_plan.financial_accounts.create(:title => 'Default financial account') if @financial_account.blank?
    @insurance = @financial_account.insurances.build(params[:insurance])

    respond_to do |format|
      if @insurance.save
        format.html { redirect_to(session[:return_to], :notice => 'Insurance was successfully created.') }
        format.xml  { render :xml => @insurance, :status => :created, :location => @insurance }
      else
        format.html { redirect_to(session[:return_to], :notice => 'Not successful') }
        format.xml  { render :xml => @insurance.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /insurances/1
  # PUT /insurances/1.xml
  def update
    @insurance = Insurance.find(params[:id])

    respond_to do |format|
      if @insurance.update_attributes(params[:insurance])
        format.html { redirect_to(financial_accounts_path, :notice => 'Insurance was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { redirect_to(financial_accounts_path, :notice => 'Not successful') }
        format.xml  { render :xml => @insurance.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /insurances/1
  # DELETE /insurances/1.xml
  def destroy
    @insurance = Insurance.find(params[:id])
    @insurance.destroy

    respond_to do |format|
      format.html { redirect_to(financial_accounts_path) }
      format.xml  { head :ok }
    end
  end
end
