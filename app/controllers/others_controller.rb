class OthersController < ApplicationController
  before_filter :authenticate_user!
  # GET /others
  # GET /others.xml
  def index
    @others = Other.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @others }
    end
  end

  # GET /others/1
  # GET /others/1.xml
  def show
    @other = Other.find(params[:id])

    respond_to do |format|
      format.html { render :layout => false }
      format.xml  { render :xml => @other }
    end
  end

  # GET /others/new
  # GET /others/new.xml
  def new
    @other = Other.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @other }
    end
  end

  # GET /others/1/edit
  def edit
    @other = Other.find(params[:id])
    render :layout => false
  end

  # POST /others
  # POST /others.xml
  def create
    session[:return_to] = request.referer
    @possession = current_user.default_plan.possessions.first
    @possession = current_user.default_plan.possessions.create(:title => 'Default possession') if @possession.blank?
    @other = @possession.others.build(params[:other])

    respond_to do |format|
      if @other.save
        format.html { redirect_to(session[:return_to], :notice => 'Other was successfully created.') }
        format.xml  { render :xml => @other, :status => :created, :location => @other }
      else
        format.html { redirect_to(session[:return_to], :notice => 'Not successful') }
        format.xml  { render :xml => @other.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /others/1
  # PUT /others/1.xml
  def update
    @other = Other.find(params[:id])

    respond_to do |format|
      if @other.update_attributes(params[:other])
        format.html { redirect_to(possessions_path, :notice => 'Other was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { redirect_to(possessions_path, :notice => 'Not successful') }
        format.xml  { render :xml => @other.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /others/1
  # DELETE /others/1.xml
  def destroy
    @other = Other.find(params[:id])
    @other.destroy

    respond_to do |format|
      format.html { redirect_to(possessions_path) }
      format.xml  { head :ok }
    end
  end
end
