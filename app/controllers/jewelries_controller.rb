class JewelriesController < ApplicationController
  before_filter :authenticate_user!
  # GET /jewelries
  # GET /jewelries.xml
  def index
    @jewelries = Jewelry.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @jewelries }
    end
  end

  # GET /jewelries/1
  # GET /jewelries/1.xml
  def show
    @jewelry = Jewelry.find(params[:id])

    respond_to do |format|
      format.html { render :layout => false }
      format.xml  { render :xml => @jewelry }
    end
  end

  # GET /jewelries/new
  # GET /jewelries/new.xml
  def new
    @jewelry = Jewelry.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @jewelry }
    end
  end

  # GET /jewelries/1/edit
  def edit
    @jewelry = Jewelry.find(params[:id])
    render :layout => false
  end

  # POST /jewelries
  # POST /jewelries.xml
  def create
    session[:return_to] = request.referer
    @possession = current_user.default_plan.possessions.first
    @possession = current_user.default_plan.possessions.create(:title => 'Default possession') if @possession.blank?
    @jewelry = @possession.jewelries.build(params[:jewelry])

    respond_to do |format|
      if @jewelry.save
        format.html { redirect_to(session[:return_to], :notice => 'Jewelry was successfully created.') }
        format.xml  { render :xml => @jewelry, :status => :created, :location => @jewelry }
      else
        format.html { redirect_to(session[:return_to], :notice => 'Not successful') }
        format.xml  { render :xml => @jewelry.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /jewelries/1
  # PUT /jewelries/1.xml
  def update
    @jewelry = Jewelry.find(params[:id])

    respond_to do |format|
      if @jewelry.update_attributes(params[:jewelry])
        format.html { redirect_to(possessions_path, :notice => 'Jewelry was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { redirect_to(possessions_path, :notice => 'Not successful') }
        format.xml  { render :xml => @jewelry.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /jewelries/1
  # DELETE /jewelries/1.xml
  def destroy
    @jewelry = Jewelry.find(params[:id])
    @jewelry.destroy

    respond_to do |format|
      format.html { redirect_to(possessions_path) }
      format.xml  { head :ok }
    end
  end
end
