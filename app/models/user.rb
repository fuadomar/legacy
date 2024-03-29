class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :timeoutable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
    :name, :address, :date_of_birth, :phone_number, :first_name, :last_name, :middle_name,
    :area_code_part1, :area_code_part2, :area_code_part3, :profile_image, :profile_image_cache, :notes, :gender

  after_create :create_default_plan

  #after_save :send_activation_email

  #  def send_activation_email
  #    puts "Yes" if confirmed_at_was.blank? && confirmed_at.present?
  #  end

  def confirm!
    super
    NotificationMailer.after_confirmation(self).deliver
  end


  def create_default_plan
    self.plans.create(:title => 'User default Plan')
  end

  #  has_many :agents
  #  has_many :medical_instructions

  has_many :plans, :dependent => :destroy
  has_many :relationships, :dependent => :destroy
  has_many :contacts, :dependent => :destroy
  has_many :payments, :dependent => :destroy
  has_many :agents, :dependent => :destroy

  validates_presence_of :first_name, :last_name, :date_of_birth

  mount_uploader :profile_image, ProfileImageUploader

  GENDER_MALE = 'male'
  GENDER_FEMALE = 'female'
  
  def full_name
    return "#{first_name} #{last_name}"
  end

  def admin?
    ['fuad@nascenia.com', 'faruk@nascenia.com', 'maruf@nascenia.com', 'christophertar@gmail.com'].include?(email)
  end

  #Handles leap years, leap seconds and all.
  def age
    (Time.now.to_s(:number).to_i - self.date_of_birth.to_time.to_s(:number).to_i)/10e9.to_i
  end

  def default_plan
    return self.plans.find_by_title('User default Plan')
  end

  def get_information_type_list
    list = Array.new
    list << Array['Memorial', Plan::INFORMATION_TYPE_MEMORIAL] if self.default_plan.memorials.present?
    list << Array['Medical Directive', Plan::INFORMATION_TYPE_MEDICAL] if self.default_plan.medical_instructions.present?
  end

  def get_max_information_type_count
    count = 0
    count = count + 1 if self.default_plan.memorials.present?
    count = count + 1 if self.default_plan.medical_instructions.present?
    return count
  end

  def update_with_password(params, *options)
    current_password = params.delete(:current_password)

    if params[:password].blank?
      params.delete(:password)
      params.delete(:password_confirmation) if params[:password_confirmation].blank?
    end

    result = if valid_password?(current_password)
      update_attributes(params, *options)
    else
      self.attributes = params
      self.valid?
      update_attributes(params, *options)
      #self.errors.add(:current_password, current_password.blank? ? :blank : :invalid)
      #false
    end
    clean_up_passwords
    result
  end
  
end