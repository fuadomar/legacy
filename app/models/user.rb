class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :name, :address, :date_of_birth, :phone_number, :first_name, :last_name, :middle_name,
      :area_code_part1, :area_code_part2, :area_code_part3

  has_many :agents
  has_many :medical_instructions

  validates_presence_of :name, :address, :date_of_birth

  def full_name
    return "#{first_name} #{last_name}"
  end

end
