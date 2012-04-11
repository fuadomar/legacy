class PensionPlansController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  # GET /pension_plans
  # GET /pension_plans.xml
  def index
    #    @pension_plans = PensionPlan.all
    #
    #    respond_to do |format|
    #      format.html # index.html.erb
    #      format.xml  { render :xml => @pension_plans }
    #    end
    redirect_to financial_accounts_path
  end

  # GET /pension_plans/1
  # GET /pension_plans/1.xml
  def show
    @pension_plan = PensionPlan.find(params[:id])

    respond_to do |format|
      format.html { render :layout => false}
      format.xml  { render :xml => @pension_plan }
    end
  end

  # GET /pension_plans/new
  # GET /pension_plans/new.xml
  def new
    @pension_plan = PensionPlan.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @pension_plan }
    end
  end

  # GET /pension_plans/1/edit
  def edit
    @pension_plan = PensionPlan.find(params[:id])
    render :layout => false
  end

  # POST /pension_plans
  # POST /pension_plans.xml
  def create
    session[:return_to] = request.referer
    @financial_account = current_user.default_plan.financial_accounts.first
    @financial_account = current_user.default_plan.financial_accounts.create(:title => 'Default financial account') if @financial_account.blank?
    @pension_plan = @financial_account.pension_plans.build(params[:pension_plan])

    respond_to do |format|
      if @pension_plan.save
        format.html { redirect_to(session[:return_to], :notice => 'Pension plan was successfully created.') }
        format.xml  { render :xml => @pension_plan, :status => :created, :location => @pension_plan }
      else
        format.html { redirect_to(session[:return_to], :notice => 'Not successful') }
        format.xml  { render :xml => @pension_plan.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pension_plans/1
  # PUT /pension_plans/1.xml
  def update
    @pension_plan = PensionPlan.find(params[:id])

    respond_to do |format|
      if @pension_plan.update_attributes(params[:pension_plan])
        format.html { redirect_to(financial_accounts_path, :notice => 'Pension plan was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { redirect_to(financial_accounts_path, :notice => 'Not successful') }
        format.xml  { render :xml => @pension_plan.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pension_plans/1
  # DELETE /pension_plans/1.xml
  def destroy
    @pension_plan = PensionPlan.find(params[:id])
    @pension_plan.destroy

    respond_to do |format|
      format.html { redirect_to(financial_accounts_path) }
      format.xml  { head :ok }
    end
  end
end
