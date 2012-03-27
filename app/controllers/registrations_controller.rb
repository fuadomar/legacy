class RegistrationsController < Devise::RegistrationsController
  def after_inactive_sign_up_path_for(resource)
    flash[:error] = "A account confirmation mail has been send to your email #{resource.email}"
    return new_user_session_path
  end
end