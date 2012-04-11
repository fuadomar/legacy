class Agent < ActiveRecord::Base
  belongs_to :medical_instruction
  belongs_to :user
  validates :name, :presence => true
end
