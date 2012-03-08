class PublicsController < ApplicationController
  def index
  end

  def plan
    if (current_user.present?)
      agent = Agent.find_by_id(session[:agent_id])
      medical_instruction = MedicalInstruction.find_by_id(session[:medical_instruction_id])
      if (agent.present?)
        agent.user_id = current_user.id
        if (agent.save)
          message = "Agent saved successfully. "
        else
          message = "Failed to save agent. "
        end
      end
      if (medical_instruction.present?)
        medical_instruction.user_id = current_user.id
        if (medical_instruction.save)
          message = "Medical instructions saved successfully. "
        else
          message = "Failed to save medical instructions. "
        end
      end
      session[:agent_id] = nil
      session[:medical_instruction_id] = nil
    end
  end
end
