class Relationship < ActiveRecord::Base
  mount_uploader :image, ProfileImageUploader
  mount_uploader :doc, DocumentUploader

  belongs_to :user
  has_many :sharing_rules

  #  before_create :create_user
  #
  #  def create_user
  #    user = User.new
  #    user.first_name = self.first_name
  #    user.middle_name = self.middle_name
  #    self.login_user_id = user.id
  #  end

  def full_name
    return "#{first_name} #{middle_name} #{last_name}"
  end
end
