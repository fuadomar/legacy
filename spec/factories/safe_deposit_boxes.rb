# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :safe_deposit_box do
    possession_id 1
    name_of_bank "MyString"
    street_address "MyString"
    city "MyString"
    state "MyString"
    zip "MyString"
    box_number "MyString"
    location_of_key "MyString"
    note "MyText"
  end
end
