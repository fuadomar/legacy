class Users::OmniauthCallbacksController < ApplicationController
  def facebook
    authenticate_omniauth_user()
  end

  def failure
    puts("Omniauth failure callback")
    logger.info("Omniauth failure callback")
    @auth = env["omniauth.auth"]
    redirect_to(root_path, :notice => "Login failed, try again")
  end

  def authenticate_omniauth_user
    omniauth = request.env["omniauth.auth"]
    authentication = Authentication.find_by_provider_and_uid(omniauth['provider'], omniauth['uid'])
    if (authentication.present?)
      sign_in_and_redirect(:user, authentication.user)
      flash[:notice] = 'You have successfully logged in'
    elsif (current_user.present?)
      current_user.authentications.create!(
          :provider => omniauth['provider'],
          :uid => omniauth['uid'],
          :token => omniauth['credentials']['token'],
          :secret => omniauth['credentials']['secret'])
      redirect_to root_path()
    else
      user = User.new
      user.apply_omniauth(omniauth)
      if (user.save)
        sign_in_and_redirect(:user, authentication.user)
      else
        user.password = Devise.friendly_token
        if (omniauth['provider'] == Authentication::PROVIDER_FACEBOOK)
          user.email = omniauth['user_info']['email']
          user.first_name = omniauth['user_info']['first_name']
          user.last_name = omniauth['user_info']['last_name']
          if (omniauth['extra']['user_hash']['location'].present?)
            user.location = omniauth['extra']['user_hash']['location']['name']
          end
          user.relationship_status = omniauth['extra']['user_hash']['relationship_status']
        end
        user.save
        flash[:notice] = 'You have signed in successfully'
        sign_in_and_redirect(:user, user)
      end
    end
  end
end
