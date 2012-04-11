class CreditCardsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  # GET /credit_cards
  # GET /credit_cards.xml
  def index
    #    @credit_cards = CreditCard.all
    #
    #    respond_to do |format|
    #      format.html # index.html.erb
    #      format.xml  { render :xml => @credit_cards }
    #    end
    redirect_to financial_accounts_path
  end

  # GET /credit_cards/1
  # GET /credit_cards/1.xml
  def show
    @credit_card = CreditCard.find(params[:id])

    respond_to do |format|
      format.html { render :layout => false}
      format.xml  { render :xml => @credit_card }
    end
  end

  # GET /credit_cards/new
  # GET /credit_cards/new.xml
  def new
    @credit_card = CreditCard.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @credit_card }
    end
  end

  # GET /credit_cards/1/edit
  def edit
    @credit_card = CreditCard.find(params[:id])
    render :layout => false
  end

  # POST /credit_cards
  # POST /credit_cards.xml
  def create
    session[:return_to] = request.referer
    @financial_account = current_user.default_plan.financial_accounts.first
    @financial_account = current_user.default_plan.financial_accounts.create(:title => 'Default financial account') if @financial_account.blank?
    @credit_card = @financial_account.credit_cards.build(params[:credit_card])

    respond_to do |format|
      if @credit_card.save
        format.html { redirect_to(session[:return_to], :notice => 'Credit card was successfully created.') }
        format.xml  { render :xml => @credit_card, :status => :created, :location => @credit_card }
      else
        format.html { redirect_to(session[:return_to], :notice => 'Not successful') }
        format.xml  { render :xml => @credit_card.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /credit_cards/1
  # PUT /credit_cards/1.xml
  def update
    @credit_card = CreditCard.find(params[:id])

    respond_to do |format|
      if @credit_card.update_attributes(params[:credit_card])
        format.html { redirect_to(financial_accounts_path, :notice => 'Credit card was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { redirect_to(financial_accounts_path, :notice => 'Not successful') }
        format.xml  { render :xml => @credit_card.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /credit_cards/1
  # DELETE /credit_cards/1.xml
  def destroy
    @credit_card = CreditCard.find(params[:id])
    @credit_card.destroy

    respond_to do |format|
      format.html { redirect_to(financial_accounts_path) }
      format.xml  { head :ok }
    end
  end
end
