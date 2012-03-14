class Plan < ActiveRecord::Base
  belongs_to :user
  has_many :medical_instructions
  has_many :memorials

  validates :title, :presence => true
end
