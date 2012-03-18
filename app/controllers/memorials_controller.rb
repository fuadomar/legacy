class MemorialsController < ApplicationController
  load_and_authorize_resource
  # GET /memorials
  # GET /memorials.xml
  def index
    @memorials = Memorial.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @memorials }
    end
  end

  # GET /memorials/1
  # GET /memorials/1.xml
  def show
    @memorial = Memorial.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @memorial }
    end
  end

  # GET /memorials/new
  # GET /memorials/new.xml
  def new
    @memorial = Memorial.new
    @plan = Plan.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @memorial }
    end
  end

  # GET /memorials/1/edit
  def edit
    @memorial = Memorial.find(params[:id])
    @plan = @memorial.plan
  end

  # POST /memorials
  # POST /memorials.xml
  def create
    @plan = current_user.plans.new(params[:plan])
    @memorial = @plan.memorials.build(params[:memorial])

    respond_to do |format|
      if @plan.save
        format.html { redirect_to(@memorial, :notice => 'Memorial was successfully created.') }
        format.xml  { render :xml => @memorial, :status => :created, :location => @memorial }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @memorial.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /memorials/1
  # PUT /memorials/1.xml
  def update
    @memorial = Memorial.find(params[:id])

    respond_to do |format|
      if @memorial.update_attributes(params[:memorial])
        format.html { redirect_to(@memorial, :notice => 'Memorial was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @memorial.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /memorials/1
  # DELETE /memorials/1.xml
  def destroy
    @memorial = Memorial.find(params[:id])
    @memorial.destroy

    respond_to do |format|
      format.html { redirect_to(memorials_url) }
      format.xml  { head :ok }
    end
  end
end
