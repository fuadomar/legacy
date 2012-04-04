# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :investment_account do
    financial_account_id 1
    investment_type "MyString"
    account_provider "MyString"
    contact_information "MyString"
    last_four_digits_of_account "MyString"
    note "MyText"
  end
end
