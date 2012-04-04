# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :pension_plan do
    financial_account_id 1
    name "MyString"
    administrator "MyString"
    administrator_phone "MyString"
    primary_contact "MyString"
    benefits_for_survivors "MyString"
    last_4_digits_of_pension_id "MyString"
    beneficiary "MyString"
    pension_document "MyString"
    note "MyText"
  end
end
