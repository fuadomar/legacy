class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    session[:return_to] = request.referer
    flash[:error] = exception.message
    redirect_to session[:return_to]
  end
  
  def after_sign_in_path_for(resource)
    if (session[:redirect_to].present?)
      redirect_url = session[:redirect_to]
      session[:redirect_to] = nil
      return redirect_url
    end

    return publics_dashboard_path()
  end

end
