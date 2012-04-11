class PlansController < ApplicationController
  before_filter :authenticate_user!
  # GET /plans
  # GET /plans.xml
  def index
    #    @plans = current_user.plans.all
    #    @relation = Relationship.find_by_login_user_id(current_user.id)
    #    @parent = User.find(@relation.user_id) if @relation.present?
    #    @parent_plans = @parent.plans if @parent.present?
    #
    #    respond_to do |format|
    #      format.html # index.html.erb
    #      format.xml  { render :xml => @plans }
    #    end
    redirect_to publics_dashboard_path
  end

  # GET /plans/1
  # GET /plans/1.xml
  def show
    #    @plan = Plan.find(params[:id])
    #
    #    respond_to do |format|
    #      format.html # show.html.erb
    #      format.xml  { render :xml => @plan }
    #    end
    redirect_to publics_dashboard_path
  end

  # GET /plans/new
  # GET /plans/new.xml
  def new
    #    @plan = Plan.new
    #
    #    respond_to do |format|
    #      format.html # new.html.erb
    #      format.xml  { render :xml => @plan }
    #    end
    redirect_to publics_dashboard_path
  end

  # GET /plans/1/edit
  def edit
    #    @plan = Plan.find(params[:id])
    redirect_to publics_dashboard_path
  end

  # POST /plans
  # POST /plans.xml
  def create
    @plan = Plan.new(params[:plan])

    respond_to do |format|
      if @plan.save
        format.html { redirect_to(@plan, :notice => 'Plan was successfully created.') }
        format.xml  { render :xml => @plan, :status => :created, :location => @plan }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @plan.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /plans/1
  # PUT /plans/1.xml
  def update
    @plan = Plan.find(params[:id])

    respond_to do |format|
      if @plan.update_attributes(params[:plan])
        format.html { redirect_to(@plan, :notice => 'Plan was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @plan.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /plans/1
  # DELETE /plans/1.xml
  def destroy
    @plan = Plan.find(params[:id])
    @plan.destroy

    respond_to do |format|
      format.html { redirect_to(plans_url) }
      format.xml  { head :ok }
    end
  end

  def download
    @plan = Plan.find(params[:id])
    relationship = Relationship.find_by_login_user_id(current_user.id)
    sharing_rule = @plan.sharing_rules.where(:relationship_id => relationship.id).first if relationship.present?
    if @plan.user_id == current_user.id || sharing_rule.present?
      path = "#{Rails.root}/pdf_files/plan_#{@plan.id}.pdf"
      @plan.generate_pdf path, @plan.user, sharing_rule
      send_file(path, :disposition => 'attachment')
    else
      redirect_to publics_dashboard_path, :notice => 'You are not Authorized to download this plan'
    end
  end

  def send_pdf
    @plan = Plan.find(params[:id])
    relationship = Relationship.find(params[:relationship]) if params[:relationship].present?
    sharing_rule = @plan.sharing_rules.where(:relationship_id => relationship.id).first if relationship.present?
    if @plan.user_id == current_user.id && sharing_rule.present?
      path = "#{Rails.root}/pdf_files/plan_#{@plan.id}.pdf"
      @plan.generate_pdf path, @plan.user, sharing_rule
      NotificationMailer.send_pdf_plan(relationship, path, current_user).deliver
      return if request.xhr?
      relationship.plan_sent_on = Date.today
      relationship.save
      redirect_to publics_dashboard_path, :notice => 'Successfully Sent Your Plan'
    else
      redirect_to publics_dashboard_path, :notice => 'There was a problem with sending this plan'
    end
  end
end
