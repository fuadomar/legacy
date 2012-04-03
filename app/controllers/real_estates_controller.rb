class RealEstatesController < ApplicationController
  before_filter :authenticate_user!
  # GET /real_estates
  # GET /real_estates.xml
  def index
    @real_estates = RealEstate.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @real_estates }
    end
  end

  # GET /real_estates/1
  # GET /real_estates/1.xml
  def show
    @real_estate = RealEstate.find(params[:id])

    respond_to do |format|
      format.html { render :layout => false}
      format.xml  { render :xml => @real_estate }
    end
  end

  # GET /real_estates/new
  # GET /real_estates/new.xml
  def new
    @real_estate = RealEstate.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @real_estate }
    end
  end

  # GET /real_estates/1/edit
  def edit
    @real_estate = RealEstate.find(params[:id])
    render :layout => false
  end

  # POST /real_estates
  # POST /real_estates.xml
  def create
    session[:return_to] = request.referer
    @possession = current_user.default_plan.possessions.first
    @possession = current_user.default_plan.possessions.create(:title => 'Default possession') if @possession.blank?
    @real_estate = @possession.real_estates.build(params[:real_estate])

    respond_to do |format|
      if @real_estate.save
        format.html { redirect_to(session[:return_to], :notice => 'Real estate was successfully created.') }
        format.xml  { render :xml => @real_estate, :status => :created, :location => @real_estate }
      else
        format.html { redirect_to(session[:return_to], :notice => 'Not successful') }
        format.xml  { render :xml => @real_estate.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /real_estates/1
  # PUT /real_estates/1.xml
  def update
    @real_estate = RealEstate.find(params[:id])

    respond_to do |format|
      if @real_estate.update_attributes(params[:real_estate])
        format.html { redirect_to(possessions_path, :notice => 'Real estate was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { redirect_to(possessions_path, :notice => 'Not successful') }
        format.xml  { render :xml => @real_estate.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /real_estates/1
  # DELETE /real_estates/1.xml
  def destroy
    @real_estate = RealEstate.find(params[:id])
    @real_estate.destroy

    respond_to do |format|
      format.html { redirect_to(possessions_path) }
      format.xml  { head :ok }
    end
  end
end
