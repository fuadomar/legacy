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

    financial_account = @plan.financial_accounts.includes(:bank_accounts).first
    @financial_account_size = financial_account.bank_accounts.size if financial_account.present? && financial_account.bank_accounts.present?

    possession = @plan.possessions.includes(:real_estates).first
    @possession_size = possession.real_estates.size if possession.present? && possession.real_estates.present?

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
