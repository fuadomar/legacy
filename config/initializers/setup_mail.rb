EMAIL_RECEIVER_DEV_ENV = "do-not-reply@nascenia.com"
SITE_ADMIN_EMAIL = "do-not-reply@nascenia.com"

class DevelopmentMailInterceptor
  def self.delivering_email(message)
    message.subject = "#{message.to} #{message.subject}"
    message.to = EMAIL_RECEIVER_DEV_ENV
  end
end

ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "www.nascenia.com",
  :user_name            => "do-not-reply@nascenia.com",
  :password             => "1nascenia32",
  :authentication       => "plain",
  :enable_starttls_auto => true
}


#if Rails.env != "production"
#  puts "All mails in non-production mode will be delivered to #{EMAIL_RECEIVER_DEV_ENV}, can be changed in 'config/initializers/setup_mail.rb' "
#  ActionMailer::Base.register_interceptor(DevelopmentMailInterceptor)
#end
