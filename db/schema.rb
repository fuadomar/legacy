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

ActiveRecord::Schema.define(:version => 20120318144948) do

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

  create_table "plans", :force => true do |t|
    t.string   "title"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "relationships", :force => true do |t|
    t.integer  "user_id"
    t.string   "type"
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
  end

  create_table "sharing_rules", :force => true do |t|
    t.integer  "plan_id"
    t.integer  "relationship_id"
    t.string   "information_type"
    t.string   "condition"
    t.integer  "conditional_parameter"
    t.datetime "created_at"
    t.datetime "updated_at"
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
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
