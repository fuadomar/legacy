class PublicsController < ApplicationController
  def index
    respond_to do |format|
      format.html { render :layout => 'landing_page'}
      format.xml
    end
  end

  def why_my_legacy_plan
    respond_to do |format|
      format.html { render :layout => 'landing_page'}
      format.xml
    end
  end

  def how_it_works
    respond_to do |format|
      format.html { render :layout => 'landing_page'}
      format.xml
    end
  end

  def dashboard

  end

end
