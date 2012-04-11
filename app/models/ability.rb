class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    #    if(user.admin?)
    #      can :manage, :all
    #      return
    #    end

    alias_action :update, :destroy, :to => :modify

    #Agent
    can :create, Agent
    can :modify, Agent do |agent|
      agent.user_id == user.id
    end


    #Artwork
    can :create, Artwork
    can :read, Artwork do |artwork|
      artwork.possession_id == user.plans.first.possessions.first.id
    end
    can :modify, Artwork do |artwork|
      artwork.possession_id == user.plans.first.possessions.first.id
    end

    #BankAccount
    can :create, BankAccount
    can :read, BankAccount do |bank_account|
      bank_account.financial_account_id == user.plans.first.financial_accounts.first.id
    end
    can :modify, BankAccount do |bank_account|
      bank_account.financial_account_id == user.plans.first.financial_accounts.first.id
    end
    
    #Contact
    can :create, Contact
    
    #CreditCard
    can :create, CreditCard
    can :read, CreditCard do |credit_card|
      credit_card.financial_account_id == user.plans.first.financial_accounts.first.id
    end
    can :modify, CreditCard do |credit_card|
      credit_card.financial_account_id == user.plans.first.financial_accounts.first.id
    end
    
    #DebitCard
    can :create, DebitCard
    can :read, DebitCard do |debit_card|
      debit_card.financial_account_id == user.plans.first.financial_accounts.first.id
    end
    can :modify, DebitCard do |debit_card|
      debit_card.financial_account_id == user.plans.first.financial_accounts.first.id
    end

    #Furniture
    can :create, Furniture
    can :read, Furniture do |furniture|
      furniture.possession_id == user.plans.first.possessions.first.id
    end
    can :modify, Furniture do |furniture|
      furniture.possession_id == user.plans.first.possessions.first.id
    end

    #InHomeSafeOrVault
    can :create, InHomeSafeOrVault
    can :read, InHomeSafeOrVault do |vault|
      furniture.possession_id == user.plans.first.possessions.first.id
    end
    can :modify, InHomeSafeOrVault do |vault|
      vault.possession_id == user.plans.first.possessions.first.id
    end

    #Insurance
    can :create, Insurance
    can :read, Insurance do |insurance|
      insurance.financial_account_id == user.plans.first.financial_accounts.first.id
    end
    can :modify, Insurance do |insurance|
      insurance.financial_account_id == user.plans.first.financial_accounts.first.id
    end

    #InvestmentAccount
    can :create, InvestmentAccount
    can :read, InvestmentAccount do |investment|
      investment.financial_account_id == user.plans.first.financial_accounts.first.id
    end
    can :modify, InvestmentAccount do |investment|
      investment.financial_account_id == user.plans.first.financial_accounts.first.id
    end

    #Jewelry
    can :create, Jewelry
    can :read, Jewelry do |jewelry|
      jewelry.possession_id == user.plans.first.possessions.first.id
    end
    can :modify, Jewelry do |jewelry|
      jewelry.possession_id == user.plans.first.possessions.first.id
    end

    #Loan
    can :create, Loan
    can :read, Loan do |loan|
      loan.financial_account_id == user.plans.first.financial_accounts.first.id
    end
    can :modify, Loan do |loan|
      loan.financial_account_id == user.plans.first.financial_accounts.first.id
    end

    #Other
    can :create, Other
    can :read, Other do |other|
      other.possession_id == user.plans.first.possessions.first.id
    end
    can :modify, Other do |other|
      other.possession_id == user.plans.first.possessions.first.id
    end

    #Payment
    can :create, Payment

    #PensionPlan
    can :create, PensionPlan
    can :read, PensionPlan do |pension|
      pension.financial_account_id == user.plans.first.financial_accounts.first.id
    end
    can :modify, PensionPlan do |pension|
      pension.financial_account_id == user.plans.first.financial_accounts.first.id
    end

    #RealEstate
    can :create, RealEstate
    can :read, RealEstate do |real_estate|
      real_estate.possession_id == user.plans.first.possessions.first.id
    end
    can :modify, RealEstate do |real_estate|
      real_estate.possession_id == user.plans.first.possessions.first.id
    end

    #Relationship
    can :create, Relationship do |relationship|
      user.payments.first.present?
    end
    can :modify, Relationship do |relationship|
      relationship.user_id == user.id
    end

    #SafeDepositBox
    can :create, SafeDepositBox
    can :read, SafeDepositBox do |box|
      box.possession_id == user.plans.first.possessions.first.id
    end
    can :modify, SafeDepositBox do |box|
      box.possession_id == user.plans.first.possessions.first.id
    end

    #Vehicle
    can :create, Vehicle
    can :read, Vehicle do |vehicle|
      vehicle.possession_id == user.plans.first.possessions.first.id
    end
    can :modify, Vehicle do |vehicle|
      vehicle.possession_id == user.plans.first.possessions.first.id
    end

    #WillAndTrust
    can :create, WillAndTrust
    can :read, WillAndTrust do |will|
      will.plan_id == user.plans.first.id
    end
    can :modify, WillAndTrust do |will|
      will.plan_id == user.plans.first.id
    end



    #Memorial
    can :manage, Memorial do |memorial|
      memorial.plan.user.id == user.id
    end

    can :create, Memorial

#    can :read, Memorial do |memorial|
#      memorial.plan.sharing_rules.includes(:relationship).detect(){
#        |sr| sr.relationship.login_user_id == user.id and
#          sr.information_type == Plan::INFORMATION_TYPE_MEMORIAL and
#          (sr.condition == SharingRule::CONDITION_NOW or
#            (sr.condition == SharingRule::CONDITION_VIEWER_TURN and
#              user.age >= sr.conditional_parameter) or
#            (sr.condition == SharingRule::CONDITION_OWNER_TURN and
#              sr.plan.user.age >= sr.conditional_parameter) or
#            (sr.condition == SharingRule::CONDITION_HOSPITALIZED and
#              sr.plan.user.physical_status == SharingRule::CONDITION_HOSPITALIZED))}
#    end


    
    #Medical Instruction
    can :manage, MedicalInstruction do |medical|
      medical.plan.user.id == user.id
    end

    can :create, MedicalInstruction

#    can :read, MedicalInstruction do |medical|
#      medical.plan.sharing_rules.includes(:relationship).detect(){
#        |sr| sr.relationship.login_user_id == user.id and
#          sr.information_type == Plan::INFORMATION_TYPE_MEDICAL and
#          (sr.condition == SharingRule::CONDITION_NOW or
#            (sr.condition == SharingRule::CONDITION_VIEWER_TURN and
#              user.age >= sr.conditional_parameter) or
#            (sr.condition == SharingRule::CONDITION_OWNER_TURN and
#              sr.plan.user.age >= sr.conditional_parameter) or
#            (sr.condition == SharingRule::CONDITION_HOSPITALIZED and
#              sr.plan.user.physical_status == SharingRule::CONDITION_HOSPITALIZED))}
#    end

  end

end