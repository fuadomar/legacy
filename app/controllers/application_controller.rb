class ApplicationController < ActionController::Base
  before_filter :redirect_to_https
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

  def ssl_enabled?
    !(Rails.env.development? || Rails.env.test?)
  end

  def https
    ssl_enabled? ? "https://" : "http://"
  end
  helper_method :https

  protected
  def redirect_to_https
    if request.protocol == "http://" && ssl_enabled?
      redirect_to :protocol => https
    end
    return true
  end
end
