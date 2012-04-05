class NotificationMailer < ActionMailer::Base
  default :from => "do-not-reply@nascenia.com"

  def send_contact(recipient, contact)
    #@user = user
    @contact = contact
    to = recipient
    subject = "My Legacy Plan Contact Message!"
    mail(:to => to, :subject => subject)
  end

  def after_confirmation(user)
    @user = user
    to = user.email
    subject = "Thank you for signing up for MyLegacyPlan.org"
    mail(:to => to, :subject => subject)
  end

  def send_pdf_plan(recipient, path, user)
    @relationship = recipient
    @user = user
    to = recipient.email
    subject = "Legacy Plan send by #{user.full_name}"
    attachments["legacy_plan_#{user.first_name}.pdf"] = File.read(path)
    mail(:to => to, :subject => subject)
  end
end
