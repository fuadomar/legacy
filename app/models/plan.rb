class Plan < ActiveRecord::Base
  belongs_to :user
  has_many :medical_instructions
  has_many :memorials
  has_many :sharing_rules

  validates :title, :presence => true
end
