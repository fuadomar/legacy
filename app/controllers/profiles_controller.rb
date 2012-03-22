class ProfilesController < ApplicationController
  before_filter :authenticate_user!


  def edit
    @user = User.find(params[:id]) if current_user.present?
  end

  def update
    @user = User.find(params[:id])
    
    respond_to do |format|
      if @user.update_attributes(params[:user])
        puts "User #{@user.inspect}"
        session[:user_update] = true
        format.html { redirect_to(edit_profile_path(@user), :notice => 'Your Basic information was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { redirect_to edit_profile_path(@user), "Failed to update yourinformation. Please correct your errors." }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

end