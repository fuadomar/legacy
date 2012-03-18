class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    #    if(user.admin?)
    #      can :manage, :all
    #      return
    #    end

    alias_action :update, :destroy, :to => :modify

    can :manage, Memorial do |memorial|
      memorial.plan.user.id == user.id
    end

    can :create, Memorial

    can :read, Memorial do |memorial|
      memorial.plan.sharing_rules.includes(:relationship).detect(){
        |sr| sr.relationship.login_user_id == user.id and
          sr.information_type == Plan::INFORMATION_TYPE_MEMORIAL and
          (sr.condition == SharingRule::CONDITION_NOW or
            (sr.condition == SharingRule::CONDITION_VIEWER_TURN and
              user.age >= sr.conditional_parameter) or
            (sr.condition == SharingRule::CONDITION_OWNER_TURN and
              sr.plan.user.age >= sr.conditional_parameter) or
            (sr.condition == SharingRule::CONDITION_HOSPITALIZED and
              sr.plan.user.physical_status == SharingRule::CONDITION_HOSPITALIZED))}
    end

    can :manage, MedicalInstruction do |medical|
      medical.plan.user.id == user.id
    end

    can :create, MedicalInstruction

    can :read, MedicalInstruction do |medical|
      medical.plan.sharing_rules.includes(:relationship).detect(){
        |sr| sr.relationship.login_user_id == user.id and
          sr.information_type == Plan::INFORMATION_TYPE_MEDICAL and
          (sr.condition == SharingRule::CONDITION_NOW or
            (sr.condition == SharingRule::CONDITION_VIEWER_TURN and
              user.age >= sr.conditional_parameter) or
            (sr.condition == SharingRule::CONDITION_OWNER_TURN and
              sr.plan.user.age >= sr.conditional_parameter) or
            (sr.condition == SharingRule::CONDITION_HOSPITALIZED and
              sr.plan.user.physical_status == SharingRule::CONDITION_HOSPITALIZED))}
    end


  end
end