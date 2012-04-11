class InHomeSafeOrVaultsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  # GET /in_home_safe_or_vaults
  # GET /in_home_safe_or_vaults.xml
  def index
    #    @in_home_safe_or_vaults = InHomeSafeOrVault.all
    #
    #    respond_to do |format|
    #      format.html # index.html.erb
    #      format.xml  { render :xml => @in_home_safe_or_vaults }
    #    end
    redirect_to possessions_path
  end

  # GET /in_home_safe_or_vaults/1
  # GET /in_home_safe_or_vaults/1.xml
  def show
    @in_home_safe_or_vault = InHomeSafeOrVault.find(params[:id])

    respond_to do |format|
      format.html { render :layout => false }
      format.xml  { render :xml => @in_home_safe_or_vault }
    end
  end

  # GET /in_home_safe_or_vaults/new
  # GET /in_home_safe_or_vaults/new.xml
  def new
    @in_home_safe_or_vault = InHomeSafeOrVault.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @in_home_safe_or_vault }
    end
  end

  # GET /in_home_safe_or_vaults/1/edit
  def edit
    @in_home_safe_or_vault = InHomeSafeOrVault.find(params[:id])
    render :layout => false
  end

  # POST /in_home_safe_or_vaults
  # POST /in_home_safe_or_vaults.xml
  def create
    session[:return_to] = request.referer
    @possession = current_user.default_plan.possessions.first
    @possession = current_user.default_plan.possessions.create(:title => 'Default possession') if @possession.blank?
    @in_home_safe_or_vault = @possession.in_home_safe_or_vaults.build(params[:in_home_safe_or_vault])

    respond_to do |format|
      if @in_home_safe_or_vault.save
        format.html { redirect_to(session[:return_to], :notice => 'In home safe or vault was successfully created.') }
        format.xml  { render :xml => @in_home_safe_or_vault, :status => :created, :location => @in_home_safe_or_vault }
      else
        format.html { redirect_to(session[:return_to], :notice => 'Not successful') }
        format.xml  { render :xml => @in_home_safe_or_vault.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /in_home_safe_or_vaults/1
  # PUT /in_home_safe_or_vaults/1.xml
  def update
    @in_home_safe_or_vault = InHomeSafeOrVault.find(params[:id])

    respond_to do |format|
      if @in_home_safe_or_vault.update_attributes(params[:in_home_safe_or_vault])
        format.html { redirect_to(possessions_path, :notice => 'In home safe or vault was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { redirect_to(possessions_path, :notice => 'Not successful') }
        format.xml  { render :xml => @in_home_safe_or_vault.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /in_home_safe_or_vaults/1
  # DELETE /in_home_safe_or_vaults/1.xml
  def destroy
    @in_home_safe_or_vault = InHomeSafeOrVault.find(params[:id])
    @in_home_safe_or_vault.destroy

    respond_to do |format|
      format.html { redirect_to(possessions_path) }
      format.xml  { head :ok }
    end
  end
end
