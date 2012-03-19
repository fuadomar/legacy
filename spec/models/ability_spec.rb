require 'spec_helper'

describe Ability do
  it "should be a new user" do
    @user = User.new
    Ability.stub(:initialize).with(@user)
  end

  describe "Ability tests for memorial" do
    before(:each) do
      @user = Factory(:user)
      @ability = Ability.new(@user)
    end

    it "user can create memorials" do
      assert @ability.can?(:create, Memorial)
    end

    it "user can manage memorials which he owns" do
      plan = @user.plans.create(:title => 'testplan')
      memorial = plan.memorials.create(:organizer_name => 'testmemorial')
      assert @ability.can?(:manage, memorial)
    end

    it "user can not read other users memorial if owner doesn't share" do
      @user_1 = Factory(:user)
      plan = @user_1.plans.create(:title => 'testplan')
      memorial = plan.memorials.create(:organizer_name => 'testmemorial')
      assert @ability.cannot?(:read, memorial)
    end

    it "user can not read parent users memorial if owner doesn't share" do
      @user_parent = Factory(:user)
      plan = @user_parent.plans.create(:title => 'testplan')
      memorial = plan.memorials.create(:organizer_name => 'testmemorial')
      @user_parent.families.create(:login_user_id => @user.id)
      assert @ability.cannot?(:read, memorial)
    end

    it "user can read parent users memorial if owner set condition to (share_now)" do
      @user_parent = Factory(:user)
      plan = @user_parent.plans.create(:title => 'testplan')
      memorial = plan.memorials.create(:organizer_name => 'testmemorial')
      family = @user_parent.families.create(:login_user_id => @user.id)
      plan.sharing_rules.create(:relationship_id => family.id, 
        :information_type => Plan::INFORMATION_TYPE_MEMORIAL,
        :condition => SharingRule::CONDITION_NOW)
      assert @ability.can?(:read, memorial)
    end

    it "user cannot read parent users memorial if owner set condition to (hospitalized) and owner physical_status not set to (hospitalized)" do
      @user_parent = Factory(:user)
      plan = @user_parent.plans.create(:title => 'testplan')
      memorial = plan.memorials.create(:organizer_name => 'testmemorial')
      family = @user_parent.families.create(:login_user_id => @user.id)
      plan.sharing_rules.create(:relationship_id => family.id, 
        :information_type => Plan::INFORMATION_TYPE_MEMORIAL,
        :condition => SharingRule::CONDITION_HOSPITALIZED)
      assert @ability.cannot?(:read, memorial)
    end

    it "user can read parent users memorial if owner set condition to (hospitalized) and owner physical_status set to (hospitalized)" do
      @user_parent = Factory(:user)
      plan = @user_parent.plans.create(:title => 'testplan')
      memorial = plan.memorials.create(:organizer_name => 'testmemorial')
      family = @user_parent.families.create(:login_user_id => @user.id)
      plan.sharing_rules.create(:relationship_id => family.id, 
        :information_type => Plan::INFORMATION_TYPE_MEMORIAL,
        :condition => SharingRule::CONDITION_HOSPITALIZED)
      @user_parent.physical_status = SharingRule::CONDITION_HOSPITALIZED
      @user_parent.save
      assert @ability.can?(:read, memorial)
    end

    it "user cannot read parent users memorial if owner set condition to (owner_turn age) and owner has not already reach at that age" do
      @user_parent = Factory(:user)
      plan = @user_parent.plans.create(:title => 'testplan')
      memorial = plan.memorials.create(:organizer_name => 'testmemorial')
      family = @user_parent.families.create(:login_user_id => @user.id)
      plan.sharing_rules.create(:relationship_id => family.id,
        :information_type => Plan::INFORMATION_TYPE_MEMORIAL,
        :condition => SharingRule::CONDITION_OWNER_TURN,
        :conditional_parameter => '25')
      @user_parent.date_of_birth = Date.today
      @user_parent.save
      assert @ability.cannot?(:read, memorial)
    end

    it "user can read parent users memorial if owner set condition to (owner_turn age) and when owner will reach at that age" do
      @user_parent = Factory(:user)
      plan = @user_parent.plans.create(:title => 'testplan')
      memorial = plan.memorials.create(:organizer_name => 'testmemorial')
      family = @user_parent.families.create(:login_user_id => @user.id)
      plan.sharing_rules.create(:relationship_id => family.id,
        :information_type => Plan::INFORMATION_TYPE_MEMORIAL,
        :condition => SharingRule::CONDITION_OWNER_TURN,
        :conditional_parameter => '25')
      @user_parent.date_of_birth = '1980-01-01'
      @user_parent.save
      assert @ability.can?(:read, memorial)
    end

    it "user cannot read parent users memorial if owner set condition to (viwer_turn age) and viwer has not already reach at that age" do
      @user_parent = Factory(:user)
      plan = @user_parent.plans.create(:title => 'testplan')
      memorial = plan.memorials.create(:organizer_name => 'testmemorial')
      family = @user_parent.families.create(:login_user_id => @user.id)
      plan.sharing_rules.create(:relationship_id => family.id,
        :information_type => Plan::INFORMATION_TYPE_MEMORIAL,
        :condition => SharingRule::CONDITION_VIEWER_TURN,
        :conditional_parameter => '25')
      @user.date_of_birth = Date.today
      @user.save
      assert @ability.cannot?(:read, memorial)
    end

    it "user can read parent users memorial if owner set condition to (viwer_turn) and when viwer will reach at that age" do
      @user_parent = Factory(:user)
      plan = @user_parent.plans.create(:title => 'testplan')
      memorial = plan.memorials.create(:organizer_name => 'testmemorial')
      family = @user_parent.families.create(:login_user_id => @user.id)
      plan.sharing_rules.create(:relationship_id => family.id,
        :information_type => Plan::INFORMATION_TYPE_MEMORIAL,
        :condition => SharingRule::CONDITION_VIEWER_TURN,
        :conditional_parameter => '25')
      @user.date_of_birth = '1980-01-01'
      @user.save
      assert @ability.can?(:read, memorial)
    end
  end


  
  describe "Ability tests for medical instructions" do
    before(:each) do
      @user = Factory(:user)
      @ability = Ability.new(@user)
    end

    it "user can create medical instructions" do
      assert @ability.can?(:create, MedicalInstruction)
    end

    it "user can manage medical instructions which he owns" do
      plan = @user.plans.create(:title => 'testplan')
      medical_instruction = plan.medical_instructions.create(:wish => 'testmedical_instructions')
      assert @ability.can?(:manage, medical_instruction)
    end

    it "user can not read other users medical instruction if owner doesn't share" do
      @user_1 = Factory(:user)
      plan = @user_1.plans.create(:title => 'testplan')
      medical_instruction = plan.medical_instructions.create(:wish => 'testmedical_instructions')
      assert @ability.cannot?(:read, medical_instruction)
    end

    it "user can not read parent users medical instruction if owner doesn't share" do
      @user_parent = Factory(:user)
      plan = @user_parent.plans.create(:title => 'testplan')
      medical_instruction = plan.medical_instructions.create(:wish => 'testmedical_instructions')
      @user_parent.families.create(:login_user_id => @user.id)
      assert @ability.cannot?(:read, medical_instruction)
    end

    it "user can read parent users medical instruction if owner set condition to (share_now)" do
      @user_parent = Factory(:user)
      plan = @user_parent.plans.create(:title => 'testplan')
      medical_instruction = plan.medical_instructions.create(:wish => 'testmedical_instructions')
      family = @user_parent.families.create(:login_user_id => @user.id)
      plan.sharing_rules.create(:relationship_id => family.id,
        :information_type => Plan::INFORMATION_TYPE_MEDICAL,
        :condition => SharingRule::CONDITION_NOW)
      assert @ability.can?(:read, medical_instruction)
    end

    it "user cannot read parent users medical instruction if owner set condition to (hospitalized) and owner physical_status not set to (hospitalized)" do
      @user_parent = Factory(:user)
      plan = @user_parent.plans.create(:title => 'testplan')
      medical_instruction = plan.medical_instructions.create(:wish => 'testmedical_instructions')
      family = @user_parent.families.create(:login_user_id => @user.id)
      plan.sharing_rules.create(:relationship_id => family.id,
        :information_type => Plan::INFORMATION_TYPE_MEDICAL,
        :condition => SharingRule::CONDITION_HOSPITALIZED)
      assert @ability.cannot?(:read, medical_instruction)
    end

    it "user can read parent users medical instruction if owner set condition to (hospitalized) and owner physical_status set to (hospitalized)" do
      @user_parent = Factory(:user)
      plan = @user_parent.plans.create(:title => 'testplan')
      medical_instruction = plan.medical_instructions.create(:wish => 'testmedical_instructions')
      family = @user_parent.families.create(:login_user_id => @user.id)
      plan.sharing_rules.create(:relationship_id => family.id,
        :information_type => Plan::INFORMATION_TYPE_MEDICAL,
        :condition => SharingRule::CONDITION_HOSPITALIZED)
      @user_parent.physical_status = SharingRule::CONDITION_HOSPITALIZED
      @user_parent.save
      assert @ability.can?(:read, medical_instruction)
    end

    it "user cannot read parent users medical instruction if owner set condition to (owner_turn age) and owner has not already reach at that age" do
      @user_parent = Factory(:user)
      plan = @user_parent.plans.create(:title => 'testplan')
      medical_instruction = plan.medical_instructions.create(:wish => 'testmedical_instructions')
      family = @user_parent.families.create(:login_user_id => @user.id)
      plan.sharing_rules.create(:relationship_id => family.id,
        :information_type => Plan::INFORMATION_TYPE_MEDICAL,
        :condition => SharingRule::CONDITION_OWNER_TURN,
        :conditional_parameter => '25')
      @user_parent.date_of_birth = Date.today
      @user_parent.save
      assert @ability.cannot?(:read, medical_instruction)
    end

    it "user can read parent users medical instruction if owner set condition to (owner_turn age) and when owner will reach at that age" do
      @user_parent = Factory(:user)
      plan = @user_parent.plans.create(:title => 'testplan')
      medical_instruction = plan.medical_instructions.create(:wish => 'testmedical_instructions')
      family = @user_parent.families.create(:login_user_id => @user.id)
      plan.sharing_rules.create(:relationship_id => family.id,
        :information_type => Plan::INFORMATION_TYPE_MEDICAL,
        :condition => SharingRule::CONDITION_OWNER_TURN,
        :conditional_parameter => '25')
      @user_parent.date_of_birth = '1980-01-01'
      @user_parent.save
      assert @ability.can?(:read, medical_instruction)
    end

    it "user cannot read parent users medical instruction if owner set condition to (viwer_turn age) and viwer has not already reach at that age" do
      @user_parent = Factory(:user)
      plan = @user_parent.plans.create(:title => 'testplan')
      medical_instruction = plan.medical_instructions.create(:wish => 'testmedical_instructions')
      family = @user_parent.families.create(:login_user_id => @user.id)
      plan.sharing_rules.create(:relationship_id => family.id,
        :information_type => Plan::INFORMATION_TYPE_MEDICAL,
        :condition => SharingRule::CONDITION_VIEWER_TURN,
        :conditional_parameter => '25')
      @user.date_of_birth = Date.today
      @user.save
      assert @ability.cannot?(:read, medical_instruction)
    end

    it "user can read parent users medical instruction if owner set condition to (viwer_turn) and when viwer will reach at that age" do
      @user_parent = Factory(:user)
      plan = @user_parent.plans.create(:title => 'testplan')
      medical_instruction = plan.medical_instructions.create(:wish => 'testmedical_instructions')
      family = @user_parent.families.create(:login_user_id => @user.id)
      plan.sharing_rules.create(:relationship_id => family.id,
        :information_type => Plan::INFORMATION_TYPE_MEDICAL,
        :condition => SharingRule::CONDITION_VIEWER_TURN,
        :conditional_parameter => '25')
      @user.date_of_birth = '1980-01-01'
      @user.save
      assert @ability.can?(:read, medical_instruction)
    end
  end

end