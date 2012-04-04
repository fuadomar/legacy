class WillAndTrustsController < ApplicationController
  before_filter :authenticate_user!
  # GET /will_and_trusts
  # GET /will_and_trusts.xml
  def index
    @will_and_trusts = current_user.default_plan.will_and_trusts
    @will_and_trust = WillAndTrust.new

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @will_and_trusts }
    end
  end

  # GET /will_and_trusts/1
  # GET /will_and_trusts/1.xml
  def show
    @will_and_trust = WillAndTrust.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @will_and_trust }
    end
  end

  # GET /will_and_trusts/new
  # GET /will_and_trusts/new.xml
  def new
    @will_and_trust = WillAndTrust.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @will_and_trust }
    end
  end

  # GET /will_and_trusts/1/edit
  def edit
    @will_and_trust = WillAndTrust.find(params[:id])
    render :layout => false
  end

  # POST /will_and_trusts
  # POST /will_and_trusts.xml
  def create
    @will_and_trust = current_user.default_plan.will_and_trusts.new(params[:will_and_trust])
    
    #@will_and_trust = WillAndTrust.new(params[:will_and_trust])

    respond_to do |format|
      if @will_and_trust.save
        format.html { redirect_to(will_and_trusts_path, :notice => 'Will and trust was successfully created.') }
        format.xml  { render :xml => @will_and_trust, :status => :created, :location => @will_and_trust }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @will_and_trust.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /will_and_trusts/1
  # PUT /will_and_trusts/1.xml
  def update
    @will_and_trust = WillAndTrust.find(params[:id])

    respond_to do |format|
      if @will_and_trust.update_attributes(params[:will_and_trust])
        format.html { redirect_to(will_and_trusts_path, :notice => 'Will and trust was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @will_and_trust.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /will_and_trusts/1
  # DELETE /will_and_trusts/1.xml
  def destroy
    @will_and_trust = WillAndTrust.find(params[:id])
    @will_and_trust.destroy

    respond_to do |format|
      format.html { redirect_to(will_and_trusts_url) }
      format.xml  { head :ok }
    end
  end
end
