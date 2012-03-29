# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :bank_account do
    financial_account_id 1
    name_of_bank "MyString"
    type_of_account "MyString"
    location_of_bank "MyString"
    last_4_digit_of_account 1
    note "MyText"
  end
end
