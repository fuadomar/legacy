class ApplicationController < ActionController::Base
  protect_from_forgery

  def after_sign_in_path_for(resource)
    if (session[:redirect_to].present?)
      redirect_url = session[:redirect_to]
      session[:redirect_to] = nil
      return redirect_url
    end

    return publics_plan_path()
  end
end
