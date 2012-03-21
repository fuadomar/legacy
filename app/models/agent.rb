class Agent < ActiveRecord::Base
  belongs_to :medical_instruction
  validates :name, :presence => true
end
