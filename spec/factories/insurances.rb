# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :insurance do
    financial_account_id 1
    type_of_insurance "MyString"
    insurance_company "MyString"
    name_of_agency "MyString"
    phone "MyString"
    primary_agent "MyString"
    value_of_the_policy "MyString"
    last_4_digits_of_policy "MyString"
    beneficiary "MyString"
    copy_of_policy "MyString"
    note "MyText"
  end
end
