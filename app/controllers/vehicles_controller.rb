class VehiclesController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  # GET /vehicles
  # GET /vehicles.xml
  def index
    #    @vehicles = Vehicle.all
    #
    #    respond_to do |format|
    #      format.html # index.html.erb
    #      format.xml  { render :xml => @vehicles }
    #    end
    redirect_to possessions_path
  end

  # GET /vehicles/1
  # GET /vehicles/1.xml
  def show
    @vehicle = Vehicle.find(params[:id])

    respond_to do |format|
      format.html { render :layout => false }
      format.xml  { render :xml => @vehicle }
    end
  end

  # GET /vehicles/new
  # GET /vehicles/new.xml
  def new
    @vehicle = Vehicle.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @vehicle }
    end
  end

  # GET /vehicles/1/edit
  def edit
    @vehicle = Vehicle.find(params[:id])
    render :layout => false
  end

  # POST /vehicles
  # POST /vehicles.xml
  def create
    session[:return_to] = request.referer
    @possession = current_user.default_plan.possessions.first
    @possession = current_user.default_plan.possessions.create(:title => 'Default possession') if @possession.blank?
    @vehicle = @possession.vehicles.build(params[:vehicle])

    respond_to do |format|
      if @vehicle.save
        format.html { redirect_to(session[:return_to], :notice => 'Vehicle was successfully created.') }
        format.xml  { render :xml => @vehicle, :status => :created, :location => @vehicle }
      else
        format.html { redirect_to(session[:return_to], :notice => 'Not successful') }
        format.xml  { render :xml => @vehicle.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /vehicles/1
  # PUT /vehicles/1.xml
  def update
    @vehicle = Vehicle.find(params[:id])

    respond_to do |format|
      if @vehicle.update_attributes(params[:vehicle])
        format.html { redirect_to(possessions_path, :notice => 'Vehicle was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { redirect_to(possessions_path, :notice => 'Not successful')}
        format.xml  { render :xml => @vehicle.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /vehicles/1
  # DELETE /vehicles/1.xml
  def destroy
    @vehicle = Vehicle.find(params[:id])
    @vehicle.destroy

    respond_to do |format|
      format.html { redirect_to(possessions_path) }
      format.xml  { head :ok }
    end
  end
end
