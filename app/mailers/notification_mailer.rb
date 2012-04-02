class NotificationMailer < ActionMailer::Base
  default :from => "do-not-reply@nascenia.com"

  def send_contact(recipient, contact)
    #@user = user
    @contact = contact
    to = recipient
    subject = "My Legacy Plan Contact Message!"
    mail(:to => to, :subject => subject)
  end
end
