class SafeDepositBoxesController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  # GET /safe_deposit_boxes
  # GET /safe_deposit_boxes.xml
  def index
    #    @safe_deposit_boxes = SafeDepositBox.all
    #
    #    respond_to do |format|
    #      format.html # index.html.erb
    #      format.xml  { render :xml => @safe_deposit_boxes }
    #    end
    redirect_to possessions_path
  end

  # GET /safe_deposit_boxes/1
  # GET /safe_deposit_boxes/1.xml
  def show
    @safe_deposit_box = SafeDepositBox.find(params[:id])

    respond_to do |format|
      format.html { render :layout => false }
      format.xml  { render :xml => @safe_deposit_box }
    end
  end

  # GET /safe_deposit_boxes/new
  # GET /safe_deposit_boxes/new.xml
  def new
    @safe_deposit_box = SafeDepositBox.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @safe_deposit_box }
    end
  end

  # GET /safe_deposit_boxes/1/edit
  def edit
    @safe_deposit_box = SafeDepositBox.find(params[:id])
    render :layout => false
  end

  # POST /safe_deposit_boxes
  # POST /safe_deposit_boxes.xml
  def create
    session[:return_to] = request.referer
    @possession = current_user.default_plan.possessions.first
    @possession = current_user.default_plan.possessions.create(:title => 'Default possession') if @possession.blank?
    @safe_deposit_box = @possession.safe_deposit_boxes.build(params[:safe_deposit_box])

    respond_to do |format|
      if @safe_deposit_box.save
        format.html { redirect_to(session[:return_to], :notice => 'Safe deposit box was successfully created.') }
        format.xml  { render :xml => @safe_deposit_box, :status => :created, :location => @safe_deposit_box }
      else
        format.html { redirect_to(session[:return_to], :notice => 'Not successful') }
        format.xml  { render :xml => @safe_deposit_box.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /safe_deposit_boxes/1
  # PUT /safe_deposit_boxes/1.xml
  def update
    @safe_deposit_box = SafeDepositBox.find(params[:id])

    respond_to do |format|
      if @safe_deposit_box.update_attributes(params[:safe_deposit_box])
        format.html { redirect_to(possessions_path, :notice => 'Safe deposit box was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { redirect_to(possessions_path, :notice => 'Not successful') }
        format.xml  { render :xml => @safe_deposit_box.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /safe_deposit_boxes/1
  # DELETE /safe_deposit_boxes/1.xml
  def destroy
    @safe_deposit_box = SafeDepositBox.find(params[:id])
    @safe_deposit_box.destroy

    respond_to do |format|
      format.html { redirect_to(possessions_path) }
      format.xml  { head :ok }
    end
  end
end
