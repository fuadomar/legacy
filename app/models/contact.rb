class Contact < ActiveRecord::Base
  belongs_to :user

  after_create :send_mail

  def send_mail
    user = User.find(self.user_id)
    recipient = 'contact@mylegacyplan.org'
    NotificationMailer.send_contact(recipient, user, self).deliver
  end
end
