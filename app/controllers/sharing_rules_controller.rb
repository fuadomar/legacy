class SharingRulesController < ApplicationController
  # GET /sharing_rules
  # GET /sharing_rules.xml
  def index
    @relationships = current_user.relationships.includes(:sharing_rules)
    @plan = Plan.find(params[:plan_id])
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @sharing_rules }
    end
  end

  # GET /sharing_rules/1
  # GET /sharing_rules/1.xml
  def show
    @sharing_rule = SharingRule.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @sharing_rule }
    end
  end

  # GET /sharing_rules/new
  # GET /sharing_rules/new.xml
  def new
    @sharing_rule = SharingRule.new
    @plan = Plan.find(params[:plan_id])

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @sharing_rule }
    end
  end

  # GET /sharing_rules/1/edit
  def edit
    @sharing_rule = SharingRule.find(params[:id])
    @plan = Plan.find(params[:plan_id])
  end

  # POST /sharing_rules
  # POST /sharing_rules.xml
  def create
    @sharing_rule = SharingRule.new(params[:sharing_rule])
    @plan = Plan.find(params[:plan_id])
    respond_to do |format|
      if @sharing_rule.save
        format.html { redirect_to(plan_sharing_rules_path(@plan), :notice => 'Sharing rule was successfully created.') }
        format.xml  { render :xml => @sharing_rule, :status => :created, :location => @sharing_rule }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @sharing_rule.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /sharing_rules/1
  # PUT /sharing_rules/1.xml
  def update
    @sharing_rule = SharingRule.find(params[:id])
    @plan = Plan.find(params[:plan_id])
    respond_to do |format|
      if @sharing_rule.update_attributes(params[:sharing_rule])
        format.html { redirect_to(plan_sharing_rules_path(@plan), :notice => 'Sharing rule was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @sharing_rule.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /sharing_rules/1
  # DELETE /sharing_rules/1.xml
  def destroy
    #new_plan_sharing_rule_path(@plan)
    @plan = Plan.find(params[:plan_id])
    @sharing_rule = SharingRule.find(params[:id])
    @sharing_rule.destroy

    respond_to do |format|
      format.html { redirect_to plan_sharing_rules_path(@plan) }
      format.xml  { head :ok }
    end
  end

  def get_create_form_tiny
    @plan = Plan.find(params[:plan_id])
    @sharing_rule = SharingRule.new
    @relationship_id = params[:relationship_id]
    respond_to do |format|
      format.js
    end
  end
  
end
