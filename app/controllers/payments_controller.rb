class PaymentsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

  def index
    redirect_to new_payment_path
  end

  def new
    @payment = Payment.new
  end


  def create
    puts "stripe_token #{params[:payment].inspect}"
    @payment = current_user.payments.new(params[:payment])
    
    if @payment.save
      redirect_to publics_dashboard_path, :notice => "Successfully Subscribed!"
    else
      render :action => :new
    end
  rescue Stripe::StripeError => e
    logger.error e.message
    @payment.errors.add :base, "There was a problem with your credit card"
    @payment.stripe_token = nil
    render :action => :new
  end

  def edit
    @payment = current_user.payments.first
  end

  def update
    @payment = Payment.find(params[:id])
    @payment.update_attributes(params[:payment])
    if @payment.save
      redirect_to root_path, :notice => "Subscription Updated"
    else
      render :action => :edit
    end
  rescue Stripe::StripeError => e
    logger.error e.message
    @payment.errors.add :base, "There was a problem with your credit card"
    @payment.stripe_token = nil
    render :action => :edit
  end
end
