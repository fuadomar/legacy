class PossessionsController < ApplicationController
  before_filter :authenticate_user!
  # GET /possessions
  # GET /possessions.xml
  def index
    @possessions = current_user.default_plan.possessions.includes(:real_estates, 
      :vehicles, :furnitures, :jewelries, :artworks, :safe_deposit_boxes,
      :in_home_safe_or_vaults, :others)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @possessions }
    end
  end

  # GET /possessions/1
  # GET /possessions/1.xml
  def show
    @possession = Possession.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @possession }
    end
  end

  # GET /possessions/new
  # GET /possessions/new.xml
  def new
    @possession = Possession.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @possession }
    end
  end

  # GET /possessions/1/edit
  def edit
    @possession = Possession.find(params[:id])
  end

  # POST /possessions
  # POST /possessions.xml
  def create
    @possession = Possession.new(params[:possession])

    respond_to do |format|
      if @possession.save
        format.html { redirect_to(@possession, :notice => 'Possession was successfully created.') }
        format.xml  { render :xml => @possession, :status => :created, :location => @possession }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @possession.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /possessions/1
  # PUT /possessions/1.xml
  def update
    @possession = Possession.find(params[:id])

    respond_to do |format|
      if @possession.update_attributes(params[:possession])
        format.html { redirect_to(@possession, :notice => 'Possession was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @possession.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /possessions/1
  # DELETE /possessions/1.xml
  def destroy
    @possession = Possession.find(params[:id])
    @possession.destroy

    respond_to do |format|
      format.html { redirect_to(possessions_url) }
      format.xml  { head :ok }
    end
  end
end
