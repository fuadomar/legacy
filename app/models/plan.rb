# encoding: utf-8
class Plan < ActiveRecord::Base
  belongs_to :user
  has_many :medical_instructions
  has_many :memorials
  has_many :sharing_rules
  has_many :possessions
  has_many :financial_accounts
  has_many :will_and_trusts

  validates :title, :presence => true

  INFORMATION_TYPE_MEDICAL = 'medical_directive'
  INFORMATION_TYPE_MEMORIAL = 'memorial'
  INFORMATION_TYPE_MY_THINGS = 'my_things'
  INFORMATION_TYPE_TRUST = 'will_trust'
  INFORMATION_TYPE_FINANCIAL = 'financial_accounts'
  INFORMATION_TYPE_GUARDIANSHIP = 'guardianship'


  def is_show_plan_link(plan_type, user_id)
    relationship_id = Relationship.where(:login_user_id => user_id)
    return self.sharing_rules.where(:relationship_id => relationship_id, :information_type => plan_type).present?
  end


  def generate_pdf path, user, sharing_rule
    img = "#{Rails.root}/public/images/pdf_big_bg.png"
    pdf = Prawn::Document.new(:background => img, :margin => [75, 75, 75, 75])

    plan_single_pdf_page_template(pdf) do
      pdf.text "Following are the wishes captured for #{user.full_name} on MyLegacyPlan.org. #{user.first_name} captured wishes in the following areas, and 7 pages follow this one:"
      pdf.move_down 20
      pdf.text "•  Accounts and Finances (one page)", :inline_format => true
      pdf.text "•  Memorial Preferences (one page)", :inline_format => true
      pdf.text "•  Gifting of personal belongings (two pages)", :inline_format => true
      pdf.text "•  Existence and location of a last will (two pages)", :inline_format => true
      pdf.text "•  Advance Medical Directive (one page)", :inline_format => true
      pdf.move_down 20
      pdf.text "This plan is dated #{user.default_plan.created_at.strftime("%B %d, %Y.")}"
    end

    pdf.start_new_page

    plan_single_pdf_page_template(pdf) do
      pdf.text "Accounts and Finances", :size => 40
      pdf.text "for Stephen Frost, dated March 24, 2012"
      pdf.move_down 10
      pdf.text "Bank Accounts", :size => 20
      pdf.move_down 5
      pdf.stroke_color "898989"
      pdf.stroke_horizontal_rule
      pdf.fill_color "000000"

      financial_account = user.default_plan.financial_accounts.first

      if financial_account.present?
        financial_account.bank_accounts.each do |bank_account|
          pdf.move_down 10
          pdf.text  "#{bank_account.name_of_bank} #{bank_account.type_of_account} XXXXXX#{bank_account.last_4_digit_of_account}"
          pdf.text "#{bank_account.location_of_bank}"
          pdf.text "Note: #{bank_account.note}"
        end
      end

      pdf.move_down 20
      pdf.fill_color "7e6127"
      pdf.text "Investment Accounts", :size => 20
      pdf.move_down 5
      pdf.stroke_horizontal_rule
      pdf.move_down 10
      pdf.fill_color "000000"
      pdf.text "E*Trade Brokerage XXXXX3321"
      pdf.text "Note: NOT retirement savings/account"
      pdf.move_down 10
      pdf.text "E*Trade Roth IRA XXXXX3323"
      pdf.text "Note: Opened in 1993 - mostly S&P index fund"
      pdf.move_down 20
      pdf.fill_color "7e6127"
      pdf.text "Loans", :size => 20
      pdf.move_down 5
      pdf.stroke_horizontal_rule
      pdf.move_down 10
      pdf.fill_color "000000"
      pdf.text "PNC Mortgage for $300,000 at origination in September 2003"
      pdf.text "Outstanding principal balance of <color rgb='ee1f25'>$123,227.90 as of February 2012</color> ", :inline_format => true
      pdf.text "Note: Our house at 123 Pine Street - no one else is owed anything on this house"
      pdf.move_down 10
      pdf.text "American Honda Finance Corporation for $18,000 at origination in May 2009"
      pdf.text "Outstanding principal balance of <color rgb='ee1f25'>~$8,000 as of February 2012</color>", :inline_format => true
    end

    pdf.start_new_page

    plan_single_pdf_page_template(pdf) do
      memorial = user.default_plan.memorials.first
      pdf.text "Memorial Preferences", :size => 40
      if memorial.present?
        pdf.text "for #{user.full_name}, dated #{memorial.updated_at.strftime("%B %d, %Y.")}"
        pdf.move_down 20
        pdf.text "Organizer Name: #{memorial.organizer_name}"
        pdf.move_down 10
        pdf.text "Organizer Prefereneces: #{memorial.organizer_preferences}"
        pdf.move_down 10
        pdf.text "#{memorial.prepared_services}"
        pdf.move_down 10
        pdf.text "#{memorial.service_preferences}"
        pdf.move_down 10
        pdf.text "#{memorial.remains}"
        pdf.move_down 10
        pdf.text "#{memorial.additional_notes}"
      end
    end

    pdf.start_new_page

    plan_single_pdf_page_template(pdf) do
      pdf.text "Gifting of Personal Items", :size => 40
      pdf.text "for Stephen Frost, dated March 24, 2012"
      pdf.move_down 20

      pdf.stroke_horizontal_rule
      pdf.move_down 12
      pdf.bounding_box([0, pdf.cursor], :width => 155, :height => 125) do
        #        pdf.transparent(0.5) { pdf.stroke_bounds }
        pdf.image "#{Rails.root}/public/images/pdf_gift_1.png", :align => :left, :fit	=> [155, 125]
      end
      pdf.move_down 15
      pdf.bounding_box([180, pdf.cursor + 130], :width => 270) do
        #        pdf.transparent(0.5) { pdf.stroke_bounds }
        pdf.fill_color "000000"
        pdf.text "<b>Grandma’s Brooch</b> - gift to Julie.", :inline_format => true
        pdf.text "<b>You can find it</b>: in the Jewelry box in the attic", :inline_format => true
        pdf.text "<b>Note</b>: This was given to my sister before she died, by our" +
          "grandmother. It was purchased at the Chicago World’s Fair in" +
          "1933 and she wore it at our wedding. She wanted it to be carried" +
          "down to the older women in our family. It’s never been appraised.", :inline_format => true
        pdf.fill_color "7e6127"
        pdf.move_down 30
      end

      pdf.stroke_horizontal_rule
      pdf.move_down 12
      pdf.bounding_box([0, pdf.cursor], :width => 155, :height => 125) do
        #        pdf.transparent(0.5) { pdf.stroke_bounds }
        pdf.image "#{Rails.root}/public/images/pdf_gift_2.png", :align => :left, :fit	=> [155, 125]
      end
      pdf.move_down 15
      pdf.bounding_box([180, pdf.cursor + 130], :width => 270) do
        #        pdf.transparent(0.5) { pdf.stroke_bounds }
        pdf.fill_color "000000"
        pdf.text "<b>Grandfather Clock</b> - gift to Jason.", :inline_format => true
        pdf.text "<b>You can find it</b>: In the living room", :inline_format => true
        pdf.text "<b>Note</b>: Jason, I know you always loved this clock - I remember" +
          "when you were 7 and were amazed that it ran without electricity! We" +
          "bought this from an antique store in Brattleboro in 1979 - two years" +
          "before you were born.", :inline_format => true
        pdf.fill_color "7e6127"
        pdf.move_down 30
      end

      pdf.stroke_horizontal_rule
      pdf.move_down 12
      pdf.bounding_box([0, pdf.cursor], :width => 155, :height => 125) do
        #        pdf.transparent(0.5) { pdf.stroke_bounds }
        pdf.image "#{Rails.root}/public/images/pdf_gift_3.png", :align => :left, :fit	=> [155, 125]
      end
      pdf.move_down 15
      pdf.bounding_box([180, pdf.cursor + 130], :width => 270) do
        #        pdf.transparent(0.5) { pdf.stroke_bounds }
        pdf.fill_color "000000"
        pdf.text "<b>1963 MGB Convertible</b> - gift to Walter.", :inline_format => true
        pdf.text "<b>You can find it</b>: Storage locker 33C at Oakland U-Store", :inline_format => true
        pdf.text "<b>Note</b>: Walter, hopefully you can get this thing to run again" +
          "someday - the body is in great condition, which is the only" +
          "reason I hung on to it. But, I don’t mind if you decide to sell" +
          "it.", :inline_format => true
        pdf.fill_color "7e6127"
        pdf.move_down 30
      end


    end

    pdf.start_new_page

    plan_single_pdf_page_template(pdf) do
      last_will_and_trust = user.default_plan.will_and_trusts.first
      pdf.text "Last Will & Testament", :size => 40
      pdf.text "for #{user.full_name}, dated #{last_will_and_trust.updated_at.strftime("%B %d, %Y.")}" if last_will_and_trust.present?
      pdf.move_down 20
      pdf.text "#{last_will_and_trust.comment}" if last_will_and_trust.present?
    end

    pdf.start_new_page

    pdf.image "#{Rails.root}/public/images/logo.png", :position => :center

    pdf.start_new_page


    plan_single_pdf_page_template(pdf) do
      medical = user.default_plan.medical_instructions.first
      pdf.text "Advance Medical Directive", :size => 35

      if medical.present?
        pdf.text "for #{user.full_name}, dated #{medical.updated_at.strftime("%B %d, %Y.")}"
        pdf.move_down 20

        pdf.move_down 10
        pdf.text "#{medical.wish}"
        pdf.move_down 20
        pdf.text "Under the following circumstances what type of treatment do you want:"
        pdf.text "•  You have an incurable condition that cause your death shortly"
        pdf.text "•  You are unconscious and your doctors believe that you will not wake up"
        pdf.text "•  The risk and potential pain to treatment outweigh the potential benefits"
        pdf.move_down 10
        pdf.text "#{medical.incurable_condition_choice}"
        pdf.move_down 10
        pdf.text "#{medical.incurable_condition_comment}"
        pdf.move_down 20
        pdf.text "Under the following circumstances what type of treatment do you want:"
        pdf.text "•  You havepermanent irreversible mental damage"
        pdf.text "•  You may be awake at times but cannot recognize people or communicate meaningfully"
        pdf.text "•  You will require life support to keep you alive (for example feeding tubes, ventilator, dialysis, CPR, pacemaker, transfusions, etc) for the rest of your life."
        pdf.text "•  Your doctors do not believe you will ever have significant quality of life improvement"
        pdf.move_down 10
        pdf.text "#{medical.irreversible_damage_choice}"
        pdf.move_down 10
        pdf.text "#{medical.irreversible_damage_comment}"
        pdf.move_down 20
        pdf.text "Under the following circumstances what type of treatment do you want:"
        pdf.text "•  You are no longer able to make you own health decisions"
        pdf.text "•  You may be awake at times but cannot recognize people or communicate meaningfully"
        pdf.text "•  You will require life support to keep you alive (for example feeding tubes, ventilator, dialysis, CPR, pacemaker, transfusions, etc) for the rest of your life."
        pdf.text "•  Your doctors do not believe you will ever have significant quality of life improvement"
        pdf.move_down 10
        pdf.text "#{medical.unable_to_decide_choice}"
        pdf.move_down 10
        pdf.text "#{medical.unable_to_decide_comment}"
      end

    end

    pdf.render_file path
  end

  def plan_single_pdf_page_template(pdf)
    pdf.bounding_box([0, pdf.cursor], :width => 240, :height => 80) do
      pdf.image "#{Rails.root}/public/images/logo.png", :width => 177
    end
    pdf.bounding_box([330, pdf.cursor+80], :width => 120, :height => 50) do
      pdf.fill_color "7e6127"
      pdf.text "March 24, 2012", :align => :right
    end
    pdf.move_down 52
    yield
  end
  
end
