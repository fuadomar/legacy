class PublicsController < ApplicationController
  before_filter :authenticate_user!, :only => [:dashboard]
  
  def index

  end

  def why_my_legacy_plan

  end

  def how_it_works

  end

  def dashboard
    render :layout => 'application'
  end

end
