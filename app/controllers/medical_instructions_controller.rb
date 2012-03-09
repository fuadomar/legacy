class MedicalInstructionsController < ApplicationController
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
    @agent = Agent.new((session[:agent_attributes] || {}))
    @user = User.new((session[:user_attributes] || {}))

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

    @agent = Agent.new(params[:agent])
    @medical_instruction = MedicalInstruction.new(params[:medical_instruction])
    @user = User.new(params[:user])

    if(@agent.valid? && @medical_instruction.valid?)
      session[:agent_attributes] = @agent.attributes
      session[:medical_instruction_attributes] = @medical_instruction.attributes
      session[:user_attributes] = @user.attributes
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

    session[:agent_attributes].delete("user_id")
    session[:medical_instruction_attributes].delete("user_id")
    @agent = current_user.agents.new(session[:agent_attributes])
    @medical_instruction = current_user.medical_instructions.new(session[:medical_instruction_attributes])
    @user = current_user

    if (@agent.valid? && @medical_instruction.valid?)
      @agent.save
      @medical_instruction.save
      session[:agent_attributes] = nil
      session[:medical_instruction_attributes] = nil
      session[:user_attributes] = nil
      redirect_to(publics_plan_path, :notice => "Your instructions saved successfully.")
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
    @medical_instruction = current_user.medical_instructions.new(params[:medical_instruction])
    @agent = current_user.agents.new(params[:agent])

    respond_to do |format|
      if @medical_instruction.save && @agent.save
        #session[:agent_id] = @agent.id
        #session[:medical_instruction_id] = @medical_instruction.id
        format.html { redirect_to(publics_plan_path(), :notice => "Your instructions saved successfully.") }
        #format.xml  { render :xml => @medical_instruction, :status => :created, :location => @medical_instruction }
      else
        flash[:notice] = "Failed to save your instructions. Please correct your errors."
        format.html { render :action => "new" }
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
        format.html { redirect_to(@medical_instruction, :notice => 'Medical instruction was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
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
end
