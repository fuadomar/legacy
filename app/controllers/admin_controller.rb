class AdminController < ApplicationController
  before_filter :authenticate_user!

  def cpanel
    authorize! :manage, :user
    @users = User.where('id <> ?', current_user.id)
    @users = @users.find(:all)
    @users = @users.paginate(:page => params[:page], :per_page => 20)
  end

  def remove_user
    authorize! :manage, :user
    @user = User.find(params[:user_id])
    @user.destroy
    redirect_to admin_cpanel_path, :notice => 'Successfully deleted'
  end

end

