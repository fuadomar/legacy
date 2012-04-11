# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120411102020) do

  create_table "agents", :force => true do |t|
    t.string   "name"
    t.string   "home_phone"
    t.string   "cell_phone"
    t.text     "address"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.string   "relationship"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "medical_instruction_id"
    t.integer  "user_id"
  end

  create_table "artworks", :force => true do |t|
    t.integer  "possession_id"
    t.string   "name"
    t.string   "photo"
    t.string   "document"
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bank_accounts", :force => true do |t|
    t.integer  "financial_account_id"
    t.string   "name_of_bank"
    t.string   "type_of_account"
    t.string   "location_of_bank"
    t.integer  "last_4_digit_of_account"
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contacts", :force => true do |t|
    t.integer  "user_id"
    t.string   "first_name"
    t.string   "last_name"
    t.date     "date_of_birth"
    t.string   "email"
    t.string   "phone_number"
    t.text     "address"
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "credit_cards", :force => true do |t|
    t.integer  "financial_account_id"
    t.string   "card_type"
    t.string   "issuer"
    t.string   "phone"
    t.string   "last_four_digits_of_card"
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "debit_cards", :force => true do |t|
    t.integer  "financial_account_id"
    t.string   "card_type"
    t.string   "issuer"
    t.string   "phone"
    t.string   "last_four_digits_of_card"
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "financial_accounts", :force => true do |t|
    t.integer  "plan_id"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "furnitures", :force => true do |t|
    t.integer  "possession_id"
    t.string   "name"
    t.string   "photo"
    t.string   "document"
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "in_home_safe_or_vaults", :force => true do |t|
    t.integer  "possession_id"
    t.string   "name"
    t.string   "location"
    t.string   "code"
    t.string   "photo"
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "insurances", :force => true do |t|
    t.integer  "financial_account_id"
    t.string   "type_of_insurance"
    t.string   "insurance_company"
    t.string   "name_of_agency"
    t.string   "phone"
    t.string   "primary_agent"
    t.string   "value_of_the_policy"
    t.string   "last_4_digits_of_policy"
    t.string   "beneficiary"
    t.string   "copy_of_policy"
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "investment_accounts", :force => true do |t|
    t.integer  "financial_account_id"
    t.string   "investment_type"
    t.string   "account_provider"
    t.string   "contact_information"
    t.string   "last_four_digits_of_account"
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jewelries", :force => true do |t|
    t.integer  "possession_id"
    t.string   "name"
    t.string   "photo"
    t.string   "document"
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "loans", :force => true do |t|
    t.integer  "financial_account_id"
    t.string   "type_of_loan"
    t.string   "loan_originator"
    t.string   "current_owner_of_loan"
    t.string   "contact_information"
    t.string   "face_value"
    t.string   "current_debt"
    t.string   "copy_of_loan"
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "medical_instructions", :force => true do |t|
    t.text     "wish"
    t.string   "incurable_condition_choice"
    t.text     "incurable_condition_comment"
    t.string   "irreversible_damage_choice"
    t.text     "irreversible_damage_comment"
    t.string   "unable_to_decide_choice"
    t.text     "unable_to_decide_comment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "relationship"
    t.integer  "creator_id"
    t.integer  "plan_id"
    t.boolean  "instructions_agreement"
    t.boolean  "requirements_agreement"
    t.datetime "authorized_at"
  end

  create_table "memorials", :force => true do |t|
    t.integer  "plan_id"
    t.string   "organizer_name"
    t.text     "organizer_preferences"
    t.text     "prepared_services"
    t.text     "service_preferences"
    t.text     "remains"
    t.text     "additional_notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "others", :force => true do |t|
    t.integer  "possession_id"
    t.string   "name"
    t.string   "photo"
    t.string   "document"
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payments", :force => true do |t|
    t.integer  "user_id"
    t.string   "subscription_type"
    t.boolean  "subscribed",         :default => false
    t.string   "transaction_number"
    t.string   "last_4_digits"
    t.string   "stripe_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pension_plans", :force => true do |t|
    t.integer  "financial_account_id"
    t.string   "name"
    t.string   "administrator"
    t.string   "administrator_phone"
    t.string   "primary_contact"
    t.string   "benefits_for_survivors"
    t.string   "last_4_digits_of_pension_id"
    t.string   "beneficiary"
    t.string   "pension_document"
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "plans", :force => true do |t|
    t.string   "title"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "possessions", :force => true do |t|
    t.integer  "plan_id"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "real_estates", :force => true do |t|
    t.integer  "possession_id"
    t.string   "real_estate_type"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "deed"
    t.string   "photo"
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "location_of_deed"
  end

  create_table "relationships", :force => true do |t|
    t.integer  "user_id"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.date     "date_of_birth"
    t.text     "address"
    t.string   "phone_number"
    t.string   "email"
    t.string   "image"
    t.string   "doc"
    t.string   "relation"
    t.text     "additional_notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "login_user_id"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.date     "plan_sent_on"
  end

  create_table "safe_deposit_boxes", :force => true do |t|
    t.integer  "possession_id"
    t.string   "name_of_bank"
    t.string   "street_address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "box_number"
    t.string   "location_of_key"
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sharing_rules", :force => true do |t|
    t.integer  "plan_id"
    t.integer  "relationship_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "allow_financials",           :default => false
    t.boolean  "allow_possessions",          :default => false
    t.boolean  "allow_will_and_trusts",      :default => false
    t.boolean  "allow_medical_instructions", :default => false
    t.boolean  "allow_memorials",            :default => false
    t.boolean  "when_i_turn",                :default => false
    t.integer  "when_i_turn_age"
    t.boolean  "when_incapacitated",         :default => false
    t.boolean  "when_die",                   :default => false
    t.boolean  "allow_notify",               :default => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "location"
    t.string   "phone_number"
    t.string   "name"
    t.date     "date_of_birth"
    t.string   "address"
    t.string   "middle_name"
    t.string   "area_code_part1"
    t.string   "area_code_part2"
    t.string   "area_code_part3"
    t.string   "profile_image"
    t.string   "physical_status"
    t.text     "notes"
    t.string   "gender"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "vehicles", :force => true do |t|
    t.integer  "possession_id"
    t.string   "manufacturrer"
    t.string   "model"
    t.integer  "year"
    t.string   "copy_of_title"
    t.string   "location_of_original_title"
    t.string   "picture"
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type_of_vehicle"
  end

  create_table "will_and_trusts", :force => true do |t|
    t.integer  "plan_id"
    t.text     "comment"
    t.string   "file"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
