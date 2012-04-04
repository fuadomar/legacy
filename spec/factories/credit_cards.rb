# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :credit_card do
    financial_account_id 1
    card_type "MyString"
    issuer "MyString"
    phone "MyString"
    last_four_digits_of_card "MyString"
    note "MyText"
  end
end
