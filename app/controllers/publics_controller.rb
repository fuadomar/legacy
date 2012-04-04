class PublicsController < ApplicationController
  before_filter :authenticate_user!, :only => [:dashboard]
  before_filter :check_logged_in_user, :except => [:dashboard]
  def index

  end

  def why_my_legacy_plan

  end

  def how_it_works

  end

  def dashboard
    @relationships = current_user.relationships.includes(:sharing_rules) if current_user.present?
    @plan = current_user.default_plan

    financial_account = @plan.financial_accounts.includes(:bank_accounts,
      :investment_accounts, :credit_cards, :debit_cards, :loans, :insurances,
      :pension_plans).first

    if financial_account.present?
      @financial_account_size = 0
      @financial_account_size += financial_account.bank_accounts.size if financial_account.bank_accounts.present?
      @financial_account_size += financial_account.investment_accounts.size if financial_account.investment_accounts.present?
      @financial_account_size += financial_account.credit_cards.size if financial_account.credit_cards.present?
      @financial_account_size += financial_account.debit_cards.size if financial_account.debit_cards.present?
      @financial_account_size += financial_account.loans.size if financial_account.loans.present?
      @financial_account_size += financial_account.insurances.size if financial_account.insurances.present?
      @financial_account_size += financial_account.pension_plans.size if financial_account.pension_plans.present?
    end

    possession = @plan.possessions.includes(:real_estates,
      :vehicles, :furnitures, :jewelries, :artworks, :safe_deposit_boxes,
      :in_home_safe_or_vaults, :others).first

    if possession.present?
      @possession_size = 0
      @possession_size += possession.real_estates.size if possession.real_estates.present?
      @possession_size += possession.vehicles.size if possession.vehicles.present?
      @possession_size += possession.furnitures.size if possession.furnitures.present?
      @possession_size += possession.jewelries.size if possession.jewelries.present?
      @possession_size += possession.artworks.size if possession.artworks.present?
      @possession_size += possession.safe_deposit_boxes.size if possession.safe_deposit_boxes.present?
      @possession_size += possession.in_home_safe_or_vaults.size if possession.in_home_safe_or_vaults.present?
      @possession_size += possession.others.size if possession.others.present?
    end
    
    @medical_instruction = @plan.medical_instructions.first
    @memorial = @plan.memorials.first

    will_and_trusts = @plan.will_and_trusts
    @will_and_trusts_size = will_and_trusts.size if will_and_trusts.present?

    @relationships = current_user.relationships.includes(:sharing_rules).each { |relationship|
      relationship.sharing_rules.reject! { |sr| sr.plan_id != @plan.id }
    }

    render :layout => 'application_without_side_panel'
  end

  protected
  def check_logged_in_user
    redirect_to publics_dashboard_path if current_user
  end

end
