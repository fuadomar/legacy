class PlansController < ApplicationController
  before_filter :authenticate_user!, :only => [:download]
  # GET /plans
  # GET /plans.xml
  def index
    @plans = current_user.plans.all
    @relation = Relationship.find_by_login_user_id(current_user.id)
    @parent = User.find(@relation.user_id) if @relation.present?
    @parent_plans = @parent.plans if @parent.present?
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @plans }
    end
  end

  # GET /plans/1
  # GET /plans/1.xml
  def show
    @plan = Plan.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @plan }
    end
  end

  # GET /plans/new
  # GET /plans/new.xml
  def new
    @plan = Plan.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @plan }
    end
  end

  # GET /plans/1/edit
  def edit
    @plan = Plan.find(params[:id])
  end

  # POST /plans
  # POST /plans.xml
  def create
    @plan = Plan.new(params[:plan])

    respond_to do |format|
      if @plan.save
        format.html { redirect_to(@plan, :notice => 'Plan was successfully created.') }
        format.xml  { render :xml => @plan, :status => :created, :location => @plan }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @plan.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /plans/1
  # PUT /plans/1.xml
  def update
    @plan = Plan.find(params[:id])

    respond_to do |format|
      if @plan.update_attributes(params[:plan])
        format.html { redirect_to(@plan, :notice => 'Plan was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @plan.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /plans/1
  # DELETE /plans/1.xml
  def destroy
    @plan = Plan.find(params[:id])
    @plan.destroy

    respond_to do |format|
      format.html { redirect_to(plans_url) }
      format.xml  { head :ok }
    end
  end

  def download
    pdf = Prawn::Document.new()
    pdf.image "#{Rails.root}/public/images/logo.png"
    pdf.move_down 10
    pdf.text "March 24, 2012"
    pdf.move_down 35
    pdf.text "Following are the wishes captured for Stephen Frost on MyLegacyPlan.org. Stephen captured
wishes in the following areas, and 7 pages follow this one:"
    pdf.move_down 20
    pdf.text "Accounts and Finances (one page)"
    pdf.text "Memorial Preferences (one page)"
    pdf.text "Gifting of personal belongings (two pages)"
    pdf.text "Existence and location of a last will (two pages)"
    pdf.text "Advance Medical Directive (one page)"
    pdf.move_down 20
    pdf.text "This plan is dated March 24, 2012."


    pdf.start_new_page


    pdf.image "#{Rails.root}/public/images/logo.png"
    pdf.move_down 10
    pdf.text "March 24, 2012"
    pdf.move_down 35
    pdf.text "Accounts and Finances", :size => 40
    pdf.text "for Stephen Frost, dated March 24, 2012"
    pdf.move_down 10


    pdf.text "Bank Accounts", :size => 20
    pdf.move_down 5
    pdf.stroke_horizontal_rule
    pdf.move_down 10
    pdf.text "Citibank Checking XXXXXX91"
    pdf.text "New York, NY Branch"
    pdf.text "Note: Joint account with Debbie"
    pdf.move_down 10
    pdf.text "Wells Fargo Savings XXXXX3312"
    pdf.text "San Francisco, CA Branch"
    pdf.text "Note: Joint account with Debbie. Opened in 1980 for vacation savings"

    pdf.move_down 20

    pdf.text "Investment Accounts", :size => 20
    pdf.move_down 5
    pdf.stroke_horizontal_rule
    pdf.move_down 10
    pdf.text "E*Trade Brokerage XXXXX3321"
    pdf.text "Note: NOT retirement savings/account"
    pdf.move_down 10
    pdf.text "E*Trade Roth IRA XXXXX3323"
    pdf.text "Note: Opened in 1993 - mostly S&P index fund"

    pdf.move_down 20

    pdf.text "Loans", :size => 20
    pdf.move_down 5
    pdf.stroke_horizontal_rule
    pdf.move_down 10
    pdf.text "PNC Mortgage for $300,000 at origination in September 2003"
    pdf.text "Outstanding principal balance of $123,227.90 as of February 2012"
    pdf.text "Note: Our house at 123 Pine Street - no one else is owed anything on this house"
    pdf.move_down 10
    pdf.text "American Honda Finance Corporation for $18,000 at origination in May 2009"
    pdf.text "Outstanding principal balance of ~$8,000 as of February 2012"

    pdf.start_new_page


    pdf.image "#{Rails.root}/public/images/logo.png"
    pdf.move_down 10
    pdf.text "March 24, 2012"
    pdf.move_down 35
    pdf.text "Memorial Preferences", :size => 40
    pdf.text "for Stephen Frost, dated March 24, 2012"
    pdf.move_down 20
    pdf.text "I would like my wife Debbie Frost to be responsible for arranging my memorial services when I
die. My preferences for the disposition of my remains is to be cremated."
    pdf.move_down 10
    pdf.text "I have no special religious concerns regarding my memorial, but would like a service that brings
together my immediate family and close work friends."
    pdf.move_down 10
    pdf.text "I have not done any planning for my memorial service, nor have a preferred provider."


    pdf.start_new_page


    pdf.image "#{Rails.root}/public/images/logo.png"
    pdf.move_down 10
    pdf.text "March 24, 2012"
    pdf.move_down 35
    pdf.text "Last Will & Testament", :size => 40
    pdf.text "for Stephen Frost, dated March 24, 2012"
    pdf.move_down 20
    pdf.text "My last will and testament was created with Williams and Williams on 200 Market Street in San
Francisco. The original copy is in the fireproof file safe in my office. Debbie has a key to it.
Follows is a copy that was uploaded on March 1, 2012 to MyLegacyPlan.org. The will itself was
signed and witnessed on February 15th of 1999. Witnesses were my neighbor John Hutchins
and my colleague from IBM, Lisa Ketchov. There are no other copies of my will as of March 24,
2012."


    pdf.start_new_page


    pdf.image "#{Rails.root}/public/images/logo.png"
    pdf.move_down 10
    pdf.text "March 24, 2012"
    pdf.move_down 35
    pdf.text "Advance Medical Directive", :size => 40
    pdf.text "for Stephen Frost, dated March 24, 2012"
    pdf.move_down 20
    pdf.text ""



    pdf.render_file "#{Rails.root}/public/pdf/plan.pdf"
    redirect_to("/pdf/plan.pdf")
  end
end
