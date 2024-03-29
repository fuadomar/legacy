class MedicalInstructionsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  # GET /medical_instructions
  # GET /medical_instructions.xml
  def index
    @medical_instructions = MedicalInstruction.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @medical_instructions }
    end
  end

  # GET /medical_instructions/1
  # GET /medical_instructions/1.xml
  def show
    @medical_instruction = MedicalInstruction.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @medical_instruction }
    end
  end

  # GET /medical_instructions/new
  # GET /medical_instructions/new.xml
  def new
    @medical_instruction = MedicalInstruction.new((session[:medical_instruction_attributes] || {}))
    #@agent = Agent.new((session[:agent_attributes] || {}))
    #@user = User.new((session[:user_attributes] || {}))
    #@plan = Plan.new((session[:plan_attributes] || {}))

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @medical_instruction }
    end
  end

  def save_tmp_data()
    if(current_user.present?)
      redirect_to(new_medical_instruction_path())
      return
    end
    #@plan = Plan.new(params[:plan])
    @agent = Agent.new(params[:agent])
    @medical_instruction = MedicalInstruction.new(params[:medical_instruction])
    @user = User.new(params[:user])

    if(@agent.valid? && @medical_instruction.valid?)
      session[:agent_attributes] = @agent.attributes
      session[:medical_instruction_attributes] = @medical_instruction.attributes
      session[:user_attributes] = @user.attributes
      #session[:plan_attributes] = @plan.attributes
      session[:redirect_to] = save_session_data_medical_instructions_path
      redirect_to(new_session_path(User), :notice => "Please Login or Create an account, So we can save your progress")
    else
      flash[:notice] = "Failed to save your instructions. Please correct your errors."
      render :new
    end
  end

  def save_session_data
    if (current_user.blank?)
      redirect_to(new_session_path(User), :notice => "Please Login or Create an account, So we can save your progress")
      return
    end

    #session[:plan_attributes].delete("user_id")
    session[:medical_instruction_attributes].delete("plan_id")
    session[:agent_attributes].delete("medical_instruction_id")

    @plan = current_user.default_plan
    @medical_instruction = @plan.medical_instructions.new(session[:medical_instruction_attributes])
    @medical_instruction.agents.build(session[:agent_attributes])
    
    if (@medical_instruction.save)
      session[:user_attributes] = nil
      #session[:plan_attributes] = nil
      session[:medical_instruction_attributes] = nil
      session[:agent_attributes] = nil
      redirect_to(publics_dashboard_path, :notice => "Your instructions saved successfully.")
    else
      message = "Failed to save your instruction."
      render(:new)
    end
  end

  # GET /medical_instructions/1/edit
  def edit
    @medical_instruction = MedicalInstruction.find(params[:id])
  end

  # POST /medical_instructions
  # POST /medical_instructions.xml
  def create
    @plan = current_user.default_plan
    @medical_instruction = @plan.medical_instructions.new(params[:medical_instruction])
    #@medical_instruction.agents.build(params[:agent])

    respond_to do |format|
      if @medical_instruction.save
        if(session[:agent_id].present?)
          agent = Agent.find(session[:agent_id])
          agent.medical_instruction_id = @medical_instruction.id
          agent.save
          session[:agent_id] = nil
        end
        format.html { redirect_to(edit_medical_instruction_path(@medical_instruction), :notice => "Your instructions saved successfully.") }
        #format.xml  { render :xml => @medical_instruction, :status => :created, :location => @medical_instruction }
      else
        flash[:notice] = "Failed to save your instructions. Please correct your errors."
        format.html { redirect_to new_medical_instruction_path }
        format.xml  { render :xml => @medical_instruction.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /medical_instructions/1
  # PUT /medical_instructions/1.xml
  def update
    @medical_instruction = MedicalInstruction.find(params[:id])

    respond_to do |format|
      if @medical_instruction.update_attributes(params[:medical_instruction])
        format.html { redirect_to(edit_medical_instruction_path(@medical_instruction), :notice => 'Medical instruction was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { redirect_to edit_medical_instruction_path(@medical_instruction), :notice => "Failed to update your instructions. Please correct your errors." }
        format.xml  { render :xml => @medical_instruction.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /medical_instructions/1
  # DELETE /medical_instructions/1.xml
  def destroy
    @medical_instruction = MedicalInstruction.find(params[:id])
    @medical_instruction.destroy

    respond_to do |format|
      format.html { redirect_to(medical_instructions_url) }
      format.xml  { head :ok }
    end
  end


  def agreement
    @medical = current_user.default_plan.medical_instructions.first
    respond_to do |format|
      format.html
      format.xml
    end
  end

  def requirements
    @medical = current_user.default_plan.medical_instructions.first
    respond_to do |format|
      format.html
      format.xml
    end
  end

  def review
    @medical = current_user.default_plan.medical_instructions.first if current_user.present?
    @agent = current_user.default_plan.medical_instructions.first.agents.first if current_user.present? && current_user.default_plan.medical_instructions.first.present?
    @agent = Agent.find(session[:agent_id]) if @agent.blank? && session[:agent_id].present?
    respond_to do |format|
      format.html
      format.xml
    end
  end

  def agreement_tmp_save
    session[:progress_upadated_at] = Time.now
    session[:agreement] = true if params['terms_of_service'].present?
    session[:agreement] = nil if params['terms_of_service'].blank?
    respond_to do |format|
      format.html { redirect_to agreement_medical_instructions_path }
      format.xml
    end
  end

  def requirements_tmp_save
    session[:progress_upadated_at] = Time.now
    session[:requirements] = true if params['requirements'].present?
    session[:requirements] = nil if params['requirements'].blank?
    respond_to do |format|
      format.html { redirect_to requirements_medical_instructions_path }
      format.xml
    end
  end

  def review_submit
    medical = current_user.default_plan.medical_instructions.first
    agent = current_user.default_plan.medical_instructions.first.agents.first
    if (session[:agreement].present? || (medical.present? && medical.instructions_agreement?)) &&
        (session[:requirements].present? || (medical.present? && medical.requirements_agreement?)) &&
        current_user.name.present? && agent.present? && medical.present?
      medical.instructions_agreement = true
      medical.requirements_agreement = true
      medical.authorized_at = Time.now
      success = true if medical.save
    end
    respond_to do |format|
      if success
        format.html { redirect_to publics_dashboard_path, :notice => 'Successfully Authorized' }
        format.xml
      else
        format.html { redirect_to review_medical_instructions_path, :notice => 'Failed To Authorized' }
        format.xml
      end
    end
  end

end
