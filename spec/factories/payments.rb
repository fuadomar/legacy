# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :payment do
    user_id 1
    subscription_type "MyString"
    subscribed false
    email "MyString"
    transaction_number "MyString"
    last_4_digits "MyString"
    stripe_id "MyString"
  end
end
