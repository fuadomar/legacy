class FurnituresController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  # GET /furnitures
  # GET /furnitures.xml
  def index
    #    @furnitures = Furniture.all
    #
    #    respond_to do |format|
    #      format.html # index.html.erb
    #      format.xml  { render :xml => @furnitures }
    #    end
    redirect_to possessions_path
  end

  # GET /furnitures/1
  # GET /furnitures/1.xml
  def show
    @furniture = Furniture.find(params[:id])

    respond_to do |format|
      format.html { render :layout => false }
      format.xml  { render :xml => @furniture }
    end
  end

  # GET /furnitures/new
  # GET /furnitures/new.xml
  def new
    @furniture = Furniture.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @furniture }
    end
  end

  # GET /furnitures/1/edit
  def edit
    @furniture = Furniture.find(params[:id])
    render :layout => false
  end

  # POST /furnitures
  # POST /furnitures.xml
  def create
    session[:return_to] = request.referer
    @possession = current_user.default_plan.possessions.first
    @possession = current_user.default_plan.possessions.create(:title => 'Default possession') if @possession.blank?
    @furniture = @possession.furnitures.build(params[:furniture])

    respond_to do |format|
      if @furniture.save
        format.html { redirect_to(session[:return_to], :notice => 'Furniture was successfully created.') }
        format.xml  { render :xml => @furniture, :status => :created, :location => @furniture }
      else
        format.html { redirect_to(session[:return_to], :notice => 'Not successful') }
        format.xml  { render :xml => @furniture.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /furnitures/1
  # PUT /furnitures/1.xml
  def update
    @furniture = Furniture.find(params[:id])

    respond_to do |format|
      if @furniture.update_attributes(params[:furniture])
        format.html { redirect_to(possessions_path, :notice => 'Furniture was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { redirect_to(possessions_path, :notice => 'Not successful') }
        format.xml  { render :xml => @furniture.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /furnitures/1
  # DELETE /furnitures/1.xml
  def destroy
    @furniture = Furniture.find(params[:id])
    @furniture.destroy

    respond_to do |format|
      format.html { redirect_to(possessions_path) }
      format.xml  { head :ok }
    end
  end
end
