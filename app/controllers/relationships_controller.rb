class RelationshipsController < ApplicationController
  before_filter :authenticate_user!
  # GET /relationships
  # GET /relationships.xml
  def index
    @families = current_user.families.all
    @friends = current_user.friends.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @relationships }
    end
  end

  # GET /relationships/1
  # GET /relationships/1.xml
  def show
    @relationship = Relationship.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @relationship }
    end
  end

  # GET /relationships/new
  # GET /relationships/new.xml
  def new
    session[:return_to] = request.referer
    @relationship = Relationship.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @relationship }
    end
  end

  # GET /relationships/1/edit
  def edit
    @relationship = Relationship.find(params[:id])
  end

  # POST /relationships
  # POST /relationships.xml
  def create
    #@relationship = current_user.relationships.new(params[:relationship])

    if(params[:relationship][:type] == 'family')
      @relationship = current_user.families.new(params[:relationship])
    elsif(params[:relationship][:type] == 'friend')
      @relationship = current_user.friends.new(params[:relationship])
    end
    success = true
    @user = User.new(params[:relationship])
    @user.password = "testtest"
    success = false unless @user.save
    @relationship.login_user_id = @user.id
    
    respond_to do |format|
      if success && @relationship.save
        format.html { redirect_to(session[:return_to], :notice => 'Relationship was successfully created.') }
        format.xml  { render :xml => @relationship, :status => :created, :location => @relationship }
      else
        @relationship = current_user.relationships.new(params[:relationship])
        format.html { render :action => "new", :notice => 'Please fill all the fields' }
        format.xml  { render :xml => @relationship.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /relationships/1
  # PUT /relationships/1.xml
  def update
    @relationship = Relationship.find(params[:id])

    respond_to do |format|
      if @relationship.update_attributes(params[:relationship])
        format.html { redirect_to(@relationship, :notice => 'Relationship was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @relationship.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /relationships/1
  # DELETE /relationships/1.xml
  def destroy
    @relationship = Relationship.find(params[:id])
    @relationship.destroy

    respond_to do |format|
      format.html { redirect_to(relationships_url) }
      format.xml  { head :ok }
    end
  end
end
