class AgentsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  # GET /agents
  # GET /agents.xml
  def index
    @agents = Agent.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @agents }
    end
  end

  # GET /agents/1
  # GET /agents/1.xml
  def show
    @agent = Agent.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @agent }
    end
  end

  # GET /agents/new
  # GET /agents/new.xml
  def new
    @agent = Agent.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @agent }
    end
  end

  # GET /agents/1/edit
  def edit
    @agent = Agent.find(params[:id])
  end

  # POST /agents
  # POST /agents.xml
  def create
    success = false
    @medical_instruction = current_user.default_plan.medical_instructions.first if current_user.present?
    @agent = @medical_instruction.agents.new(params[:agent]) if @medical_instruction.present?
    @agent.user_id = current_user.id if @agent.present?
    success = true if @agent.present? and @agent.save

    if(@agent.blank?)
      @agent = current_user.agents.new(params[:agent])
      success = true if @agent.save
      session[:agent_id] = @agent.id
    end
    
    respond_to do |format|
      if success
        session[:progress_upadated_at] = Time.now
        format.html { redirect_to(edit_agent_path(@agent), :notice => 'Agent was successfully created.') }
        format.xml  { render :xml => @agent, :status => :created, :location => @agent }
      else
        format.html { redirect_to(new_agent_path, :notice => "Failed to save agents. Please correct your errors.")}
        format.xml  { render :xml => @agent.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /agents/1
  # PUT /agents/1.xml
  def update
    @agent = Agent.find(params[:id])

    respond_to do |format|
      if @agent.update_attributes(params[:agent])
        session[:progress_upadated_at] = Time.now
        format.html { redirect_to(edit_agent_path(@agent), :notice => 'Agent was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { redirect_to(edit_agent_path(@agent), :notice => "Failed to update agents. Please correct your errors.") }
        format.xml  { render :xml => @agent.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /agents/1
  # DELETE /agents/1.xml
  def destroy
    @agent = Agent.find(params[:id])
    @agent.destroy

    respond_to do |format|
      format.html { redirect_to(agents_url) }
      format.xml  { head :ok }
    end
  end
end
