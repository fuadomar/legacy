class DebitCardsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  # GET /debit_cards
  # GET /debit_cards.xml
  def index
    #    @debit_cards = DebitCard.all
    #
    #    respond_to do |format|
    #      format.html # index.html.erb
    #      format.xml  { render :xml => @debit_cards }
    #    end
    redirect_to financial_accounts_path
  end

  # GET /debit_cards/1
  # GET /debit_cards/1.xml
  def show
    @debit_card = DebitCard.find(params[:id])

    respond_to do |format|
      format.html { render :layout => false}
      format.xml  { render :xml => @debit_card }
    end
  end

  # GET /debit_cards/new
  # GET /debit_cards/new.xml
  def new
    @debit_card = DebitCard.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @debit_card }
    end
  end

  # GET /debit_cards/1/edit
  def edit
    @debit_card = DebitCard.find(params[:id])
    render :layout => false
  end

  # POST /debit_cards
  # POST /debit_cards.xml
  def create
    session[:return_to] = request.referer
    @financial_account = current_user.default_plan.financial_accounts.first
    @financial_account = current_user.default_plan.financial_accounts.create(:title => 'Default financial account') if @financial_account.blank?
    @debit_card = @financial_account.debit_cards.build(params[:debit_card])

    respond_to do |format|
      if @debit_card.save
        format.html { redirect_to(session[:return_to], :notice => 'Debit card was successfully created.') }
        format.xml  { render :xml => @debit_card, :status => :created, :location => @debit_card }
      else
        format.html { redirect_to(session[:return_to], :notice => 'Not successful') }
        format.xml  { render :xml => @debit_card.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /debit_cards/1
  # PUT /debit_cards/1.xml
  def update
    @debit_card = DebitCard.find(params[:id])

    respond_to do |format|
      if @debit_card.update_attributes(params[:debit_card])
        format.html { redirect_to(financial_accounts_path, :notice => 'Debit card was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { redirect_to(financial_accounts_path, :notice => 'Not successful') }
        format.xml  { render :xml => @debit_card.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /debit_cards/1
  # DELETE /debit_cards/1.xml
  def destroy
    @debit_card = DebitCard.find(params[:id])
    @debit_card.destroy

    respond_to do |format|
      format.html { redirect_to(financial_accounts_path) }
      format.xml  { head :ok }
    end
  end
end
