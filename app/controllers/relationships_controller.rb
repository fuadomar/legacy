class RelationshipsController < ApplicationController
  before_filter :authenticate_user!
  # GET /relationships
  # GET /relationships.xml
  #  def index
  #    @relationships = current_user.relationships.all
  #
  #    respond_to do |format|
  #      format.html # index.html.erb
  #      format.xml  { render :xml => @relationships }
  #    end
  #  end

  # GET /relationships/1
  # GET /relationships/1.xml
  #  def show
  #    @relationship = Relationship.find(params[:id])
  #
  #    respond_to do |format|
  #      format.html # show.html.erb
  #      format.xml  { render :xml => @relationship }
  #    end
  #  end

  # GET /relationships/new
  # GET /relationships/new.xml
  def new
    @relationship = Relationship.new
    @sharing_rule = SharingRule.new

    respond_to do |format|
      format.html { render :layout => false}
      format.xml  { render :xml => @relationship }
    end
  end

  # GET /relationships/1/edit
  def edit
    @relationship = Relationship.find(params[:id])
    @sharing_rule = @relationship.sharing_rules.where(:plan_id => current_user.default_plan.id).first
    render :layout => false
  end

  # POST /relationships
  # POST /relationships.xml
  def create
    @relationship = current_user.relationships.new(params[:relationship])
#    success = true
#    @user = User.new(params[:relationship])
#    @user.date_of_birth = Date.today
#    @user.password = "testtest"
#    success = false unless @user.save
#    @relationship.login_user_id = @user.id

    @sharing_rule = @relationship.sharing_rules.build(params[:sharing_rule])
    @sharing_rule.plan_id = current_user.default_plan.id

    respond_to do |format|
      if @relationship.save
        format.html { redirect_to(publics_dashboard_path, :notice => 'Relationship was successfully created.') }
        format.xml  { render :xml => @relationship, :status => :created, :location => @relationship }
      else
        format.html { render :action => "new", :notice => 'Please fill all the fields' }
        format.xml  { render :xml => @relationship.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /relationships/1
  # PUT /relationships/1.xml
  def update
    @relationship = Relationship.find(params[:id])
    @sharing_rule = @relationship.sharing_rules.where(:plan_id => current_user.default_plan.id).first
    
    respond_to do |format|
      if @relationship.update_attributes(params[:relationship]) && @sharing_rule.update_attributes(params[:sharing_rule])
        format.html { redirect_to(publics_dashboard_path, :notice => 'Relationship was successfully updated.') }
        format.xml  { head :ok }
      else
        @relationship = Relationship.find(params[:id])
        format.html { render :action => "edit" }
        format.xml  { render :xml => @relationship.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /relationships/1
  # DELETE /relationships/1.xml
  def destroy
    @relationship = Relationship.find(params[:id])
    @relationship.destroy

    respond_to do |format|
      format.html { redirect_to(publics_dashboard_path) }
      format.xml  { head :ok }
    end
  end
end
