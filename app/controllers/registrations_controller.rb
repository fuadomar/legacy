class RegistrationsController < Devise::RegistrationsController
  protected
  def after_inactive_sign_up_path_for(resource)
    flash[:error] = "A account confirmation mail has been send to your email #{resource.email}"
    return new_user_session_path
  end

  def after_update_path_for(resource)
  return edit_user_registration_path
  end
end