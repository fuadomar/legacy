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
    @medical_instruction = MedicalInstruction.new
    @agent = Agent.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @medical_instruction }
    end
  end

  # GET /medical_instructions/1/edit
  def edit
    @medical_instruction = MedicalInstruction.find(params[:id])
  end

  # POST /medical_instructions
  # POST /medical_instructions.xml
  def create
    @medical_instruction = MedicalInstruction.new(params[:medical_instruction])
    @agent = Agent.new(params[:agent])

    respond_to do |format|
      if @medical_instruction.save && @agent.save
        session[:agent_id] = @agent.id
        session[:medical_instruction_id] = @medical_instruction.id
        format.html { redirect_to(new_user_registration_path(), :notice => 'Medical instruction was successfully created.') }
        #format.xml  { render :xml => @medical_instruction, :status => :created, :location => @medical_instruction }
      else
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
